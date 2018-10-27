require_relative './database_connection'
require 'uri'

class Peep

  attr_reader :id, :message, :peep_timestamp

  def initialize(id:, message:, peep_timestamp:)
    @id = id
    @message = message
    @peep_timestamp = peep_timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], peep_timestamp: peep['peep_timestamp'])
    end
  end

  def self.create(message:, peep_timestamp:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, peep_timestamp) VALUES('#{message}', '#{peep_timestamp.strftime("%Y-%m-%d %k:%M")}') RETURNING id, message, peep_timestamp;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], peep_timestamp: result[0]['peep_timestamp'])
  end

end
