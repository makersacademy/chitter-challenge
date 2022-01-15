require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :message

  def initialize(message:)
    @message = message
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY created_at DESC')
    result.map { |row| row['peep'] }
  end

  def self.create(message:)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{message}')")
  end
end
