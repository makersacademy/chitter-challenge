require 'pg'
require_relative 'database_connection'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end
end
