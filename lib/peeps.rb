require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'peep_manager')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peeping| peeping['peeps'] }
  end

  def self.create(peeps:)
    connection = PG.connect(dbname: 'peep_manager')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end

    connection.exec("INSERT INTO peeps (peeps) VALUES('#{peeps}');")
  end
end
