require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps ORDER BY time DESC;')
    output = result.map do |peep|
      {
        content: peep['content'],
        time: Time.parse(peep['time']).strftime('%b %e %I:%M%P')
      }
    end
    p output
  end
end
