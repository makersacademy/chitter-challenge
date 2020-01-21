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

  def self.create(id:, message:)
    Peeps.new(id: id, message: message)
  end
end
