require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: 'peep_manager')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end
end