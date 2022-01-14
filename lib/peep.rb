require 'PG'

class Peep

  def Peep.all
    connection = db_connect
    peeps = connection.exec('SELECT * FROM peeps;')
    peeps.map { |peep| peep["message"] }
  end

  def Peep.create_peep(message:)
    connection = db_connect
    connection.exec_params('INSERT INTO peeps (message) VALUES ($1)', [message])
  end

  def Peep.db_connect
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'chitterbase_test')
    else 
      connection = PG.connect(dbname: 'chitterbase')
    end
  end
end
