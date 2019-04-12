require 'pg'
require_relative 'database_connection'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] }
  end

  def self.create(content:)
    DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}');")
  end
end
