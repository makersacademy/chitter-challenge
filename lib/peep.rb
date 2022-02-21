require 'pg'

class Peep

  def self.all
    connection = select_db
    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    result.map { |peep| peep["message"] }
  end

  def self.create(message:)
    connection = select_db
    connection.exec_params('INSERT INTO peeps (message) VALUES ($1)', [message])
  end

  def self.select_db
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end
  end
end
