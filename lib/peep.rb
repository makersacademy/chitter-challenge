require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter')
    end
  result = connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC;")
    result.map {|peep| peep['body']}
  end

  def self.post(body:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter')
    end
    connection.exec("INSERT INTO peeps (body) VALUES ('#{body}')")
  end

end
