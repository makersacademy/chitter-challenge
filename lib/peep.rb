require_relative './database_connection'

class Peep
  def self.send(message:)
    DatabaseConnection.query "INSERT INTO peeps (message) VALUES('#{message}');"
  end

  def self.all
    result = DatabaseConnection.query "SELECT * FROM peeps ORDER BY id DESC;"
    result.map { |peep| peep['message'] }
  end
end
