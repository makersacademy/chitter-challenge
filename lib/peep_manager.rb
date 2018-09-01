require 'pg'

class Peeps

  def self.all
    result = database_connect.exec("SELECT * FROM peeps;")
    result.map { |peeps| peeps }
  end

  def self.create(peep)
    database_connect.exec("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end

  def self.database_connect
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
