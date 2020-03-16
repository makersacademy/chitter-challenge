require 'pg'

class Peeps
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    # connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter;")
    result.map {|peep| peep['peep']}
  end

  def self.create(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO chitter (peep) VALUES ('#{peep}');")
  end
end
