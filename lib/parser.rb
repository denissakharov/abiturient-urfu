module Parser
  def get_links
    domain = 'http://urfu.ru'
    path = '/ru/alpha/full'
    page = Mechanize.new.get(domain + path)
    links = []
    page.search('.urfu-admission-menu-letters .item a').each do |item|
      links << domain + item.attributes['href'].text.strip
    end
    links
  end

  def statements_by_page(link)
    page = Mechanize.new.get(link)
    statements = []
    page.search('tr[valign="top"]').each do |row|
      statement = row_to_hash(row)
      statements << statement unless statement_empty?(statement)
    end
    statements
  end

  def get_statements
    links = get_links
    links.each do |link|
      s = statements_by_page(link)
      save_statements(s)
    end
  end

  def row_to_hash(row)
    if row.search('td').length == 14
      {
        user_name:  @last_name = row.at('td').text.strip,
        number: @last_id = row.search('td')[1].text.strip.to_i,
        status: row.search('td')[2].text.strip,
        specialty: row.search('td')[5].text.strip,
        educational_program: row.search('td')[6].text.strip,
        study_mode: row.search('td')[7].text.strip,
        basis: @last_basic = row.search('td')[8].text.strip,
        points: row.search('td')[-1].text.strip.to_i
      }
    elsif row.search('td').length == 12
      {
        user_name:  @last_name,
        number: @last_id,
        status: row.search('td')[0].text.strip,
        specialty: row.search('td')[3].text.strip,
        educational_program: row.search('td')[4].text.strip,
        study_mode: row.search('td')[5].text.strip,
        basis: @last_basic = row.search('td')[6].text.strip,
        points: row.search('td')[-1].text.strip.to_i
      }
    elsif row.search('td').length < 12 && row.search('td')[6].text.strip != 'бюджетная основа' && row.search('td')[6].text.strip != 'контрактная основа'
      {
        user_name:  @last_name,
        number: @last_id,
        status: row.search('td')[0].text.strip,
        specialty: row.search('td')[3].text.strip,
        educational_program: row.search('td')[4].text.strip,
        study_mode: row.search('td')[5].text.strip,
        basis: @last_basic,
        points: row.search('td')[-1].text.strip.to_i
      }
    else
      {
        user_name:  @last_name,
        number: @last_id,
        status: row.search('td')[0].text.strip,
        specialty: row.search('td')[3].text.strip,
        educational_program: row.search('td')[4].text.strip,
        study_mode: row.search('td')[5].text.strip,
        basis: row.search('td')[6].text.strip,
        points: row.search('td')[-1].text.strip.to_i
      }
    end
  end

  def statement_empty?(statement)
    statement[:points] == 0 ? true : false
  end

  def save_statements(statements)
    @user = User.new
    statements.each do |statement|
      if @user.nil?
        @user = User.find_or_create_by(name: statement[:user_name], number: statement[:number])
      elsif @user.number == statement[:number]
        @user
      else
        @user = User.find_or_create_by(name: statement[:user_name], number: statement[:number])
      end
      Statement.find_or_create_by(
        status: statement[:status],
        specialty: statement[:specialty],
        educational_program: statement[:educational_program],
        study_mode: statement[:study_mode],
        basis: statement[:basis],
        points: statement[:points],
        user: @user
      )
    end
  end
end
