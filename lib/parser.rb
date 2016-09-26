module Parser
  def get_statements
    links = get_links
    links.each do |link|
      statements_by_page(link)
    end
  end

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
      statements << Statement.new(statement) unless statement_empty?(statement)
    end
    Statement.import statements
    puts 'ОП! Готово!'
  end

  def row_to_hash(row)
    row_length = row.search('td').length
    index_diff = (14 - row_length) >= 2 ? 2 : 0
    if row_length == 14
      @last_name = row.at('td').text.strip
      @last_id = row.search('td')[1].text.strip.to_i
      @last_basic = row.search('td')[8 - index_diff].text.strip
    elsif row_length == 12
      @last_basic = row.search('td')[8 - index_diff].text.strip
    elsif row_length < 12 && row.search('td')[6].text.strip != 'бюджетная основа' && row.search('td')[6].text.strip != 'контрактная основа'
      'break'
    else
      @last_basic = row.search('td')[8 - index_diff].text.strip
    end
    {
      name: @last_name,
      number: @last_id,
      basis: @last_basic,
      status: row.search('td')[2 - index_diff].text.strip,
      edu_doc: row.search('td')[4 - index_diff].text.strip,
      specialty: row.search('td')[5 - index_diff].text.strip,
      educational_program: row.search('td')[6 - index_diff].text.strip,
      study_mode: row.search('td')[7 - index_diff].text.strip,
      points: row.search('td')[-1].text.strip.to_i
    }
  end

  def statement_empty?(statement)
    statement[:points] == 0 ? true : false
  end
end
