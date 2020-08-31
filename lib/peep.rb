require 'pg'

class Peep

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    peeps = connection.exec "SELECT * FROM peeps"
    peeps.map { |peep| peep['message'] }
  end

  def self.create(message)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    connection.exec "INSERT INTO peeps (message) VALUES ('#{message}');"
  end

end
