# require 'pg'
require_relative 'database_connection'

class Peeps

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end

  def self.post(new_peep)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{new_peep}');")
  end
end
