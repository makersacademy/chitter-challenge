require 'pg'

class Chitter

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

  def self.peep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec("INSERT INTO peeps (time, peep) VALUES('#{Time.now.strftime("%F %T")}', '#{peep}');")
  end

end
