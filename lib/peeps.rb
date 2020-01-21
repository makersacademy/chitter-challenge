require 'pg'
require_relative 'database_connection'

class Peeps
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peeps.new(id: peep['id'], message: peep['message']) }

  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date, time;")
    Peeps.new(id: result[0]['id'], message: message)
  end
end
