require 'pg'
require 'database_connection'

class Peep
  def self.all
    if ENV['RACK_ENV'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map { |row| row['peep'] }.reverse
  end

  def self.post(peep:)
    if ENV['RACK_ENV'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end
end
