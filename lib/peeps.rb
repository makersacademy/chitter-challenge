require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map {|peep| message = [peep['peeps'],peep['timestamp']]} 
  end

  def self.create(peeps:,timestamp:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      connection.exec("INSERT INTO peeps (peeps, timestamp) VALUES ('#{peeps}','#{timestamp}');")
  end
end
