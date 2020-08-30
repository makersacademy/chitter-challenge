require 'pg'

class Peep

  def self.all
    connection = PG.connect :dbname => 'chitter_manager'

    peeps = connection.exec "SELECT * FROM peeps"

    peeps.map { |peep| peep['message'] }
  end

  def self.create(message)
    connection = PG.connect :dbname => 'chitter_manager'

    connection.exec "INSERT INTO peeps (message) VALUES ('#{message}');"
  end

end
