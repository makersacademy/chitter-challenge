require 'pg'
require_relative 'database_connection'

class Peep

  def self.list
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      peep['message']
    end
  end

  def self.create(message:)
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}')")
  end
end
