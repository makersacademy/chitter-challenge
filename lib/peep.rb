require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_feed_test')
    else
      connection = PG.connect(dbname: 'Chitter_feed')
    end

    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep['message'] }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_feed_test')
    else
      connection = PG.connect(dbname: 'Chitter_feed')
    end
  
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end
end