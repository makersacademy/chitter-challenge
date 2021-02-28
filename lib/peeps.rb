require 'pg'

class Peeps

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }
  end

  def self.create(newpeep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end

    connection.exec("INSERT INTO peeps (message) VALUES('#{newpeep}')")
  end

end
