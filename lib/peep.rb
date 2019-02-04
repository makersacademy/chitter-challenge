require 'pg'
require_relative './database_connection'

class Peep
  def self.all
    connect_db
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map { |row| row['peep'] }.reverse
  end

  def self.post(peep:)
    connect_db
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end

  private

  def self.connect_db
    if ENV['RACK_ENV'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
  end
end
