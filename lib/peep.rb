require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter_development')
    end
    result = connection.exec("SELECT * FROM peeps;")

    result.map { |row| row['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter_development')
    end
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end
end
