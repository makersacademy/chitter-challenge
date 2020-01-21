class Chitter
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |row| row['peep'] }
  end
end
