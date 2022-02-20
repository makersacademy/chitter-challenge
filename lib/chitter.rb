require 'pg'

class Chitter

  def self.post(peep)
    database_connect
    result = @connection.exec_params("INSERT INTO peeps(peep) 
                                           VALUES($1) 
                                        RETURNING peep", [peep])
    peep
  end

  def self.list
    database_connect
    result = @connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end

  private

  def self.database_connect
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else 
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end