require 'pg'
require 'sinatra/flash'
require_relative './database_connection'
require_relative 'timestamp'

class Peep
  include Timestamp

  attr_reader :id, :message

  def initialize(id:, message:)
    @id  = id
    @message = message
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message']
      )
    }.reverse
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message")
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

end
