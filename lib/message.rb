require 'pg'
require_relative './database_connection'

class Message
  attr_reader :messages

  def initialize(messages)
    @messages = messages
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map { |peeps| Message.new(peeps['messages']) }
  end

end
