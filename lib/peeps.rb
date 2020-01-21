require 'pg'
require_relative 'database_connection'

class Peeps
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all

  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;")
    Peeps.new(id: result[0]['id'], message: message)
  end
end
