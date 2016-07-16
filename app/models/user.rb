class User < ApplicationRecord
  has_many :statements

  def self.update_statements
    time = Time.now
    domain = 'http://urfu.ru'
    path = '/ru/alpha/full'
    @agent = Mechanize.new
    page = @agent.get(domain + path)
    links = []
    page.search('.urfu-admission-menu-letters .item a').each do |item|
      links << domain + item.attributes['href'].text.strip
    end
    links.each do |link|
      page = @agent.get(link)
      statements = []
      page.search('tr[valign="top"]').each do |statement|
        if statement.search('td').length == 14
          statements << {
            user_name:  @last_name = statement.at('td').text.strip,
            number: @last_id = statement.search('td')[1].text.strip.to_i,
            status: statement.search('td')[2].text.strip,
            specialty: statement.search('td')[5].text.strip,
            educational_program: statement.search('td')[6].text.strip,
            study_mode: statement.search('td')[7].text.strip,
            basis: @last_basic = statement.search('td')[8].text.strip,
            points: statement.search('td')[-1].text.strip.to_i
          }
        elsif statement.search('td').length == 12
          statements << {
            user_name:  @last_name,
            number: @last_id,
            status: statement.search('td')[0].text.strip,
            specialty: statement.search('td')[3].text.strip,
            educational_program: statement.search('td')[4].text.strip,
            study_mode: statement.search('td')[5].text.strip,
            basis: @last_basic = statement.search('td')[6].text.strip,
            points: statement.search('td')[-1].text.strip.to_i
          }
        elsif statement.search('td').length < 12 && statement.search('td')[6].text.strip != 'бюджетная основа' && statement.search('td')[6].text.strip != 'контрактная основа'
          statements << {
            user_name:  @last_name,
            number: @last_id,
            status: statement.search('td')[0].text.strip,
            specialty: statement.search('td')[3].text.strip,
            educational_program: statement.search('td')[4].text.strip,
            study_mode: statement.search('td')[5].text.strip,
            basis: @last_basic,
            points: statement.search('td')[-1].text.strip.to_i
          }
        else
          statements << {
            user_name:  @last_name,
            number: @last_id,
            status: statement.search('td')[0].text.strip,
            specialty: statement.search('td')[3].text.strip,
            educational_program: statement.search('td')[4].text.strip,
            study_mode: statement.search('td')[5].text.strip,
            basis: statement.search('td')[6].text.strip,
            points: statement.search('td')[-1].text.strip.to_i
          }
        end
      end
      unblank_statements = []
      statements.each do |i|
        unblank_statements << i unless i[:points] == 0
      end
      puts statements.length.to_s + ' заявлений в списках'
      puts 'из них ' + unblank_statements.length.to_s + ' с баллами'
      puts 'Выполнено за ' + (Time.now - time).to_s + ' сек.'
      unblank_statements.each do |statement|
        user = User.find_or_create_by(name: statement[:user_name], number: statement[:number])
        Statement.find_or_create_by(
          status: statement[:status],
          specialty: statement[:specialty],
          educational_program: statement[:educational_program],
          study_mode: statement[:study_mode],
          basis: statement[:basis],
          points: statement[:points],
          user: user
        )
      end
      puts 'еще одна страница обработана'
      sleep 20
    end
  end
end
