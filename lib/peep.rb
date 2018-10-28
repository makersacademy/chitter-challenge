require_relative 'database_connection'

class Peep

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map { |row| row['peep'] }
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{text}')")
  end

end
