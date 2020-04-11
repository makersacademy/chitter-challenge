require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps ORDER BY time DESC;')
    result.map do |peep|
      {
        content: peep['content'],
        time: Time.parse(peep['time']).strftime('%b %e %I:%M%P')
      }
    end
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end
    connection.exec("INSERT INTO peeps (content) VALUES ('#{content}');")
  end
end
