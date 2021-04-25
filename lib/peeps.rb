require 'pg'

class Peeps

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY posted_at DESC;")
    result.map { |peep| [peep['message'], peep['posted_at']] }
    
  end

  def self.new(peep)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec("INSERT INTO peeps (message) VALUES('#{peep}')")

  end
end
