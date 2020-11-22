require 'pg'
require_relative 'database_connection'

class Cheeps

  def self.all
  result = DatabaseConnection.query("SELECT * FROM cheeps")
  result.map { |cheep| cheep['text'] }
  end

  def self.create(text:)
    DatabaseConnection.query("INSERT INTO cheeps (text) VALUES('#{text}')")
  end
end
