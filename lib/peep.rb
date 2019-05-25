
require 'pg'

class Peep

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    connection.exec("INSERT INTO peeps_list (peep) VALUES('#{peep}') RETURNING id, peep;")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    result = connection.exec("SELECT * FROM peeps_list")
    result.map { |peep| peep['peep'] }
  end
end
