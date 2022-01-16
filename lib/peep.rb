require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :message, :id

  def initialize(id:, message:, timestamp:)
    @id = id
    @message = message
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY created_at DESC')

    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['peep'], timestamp: peep['created_at'])
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep, created_at", [message])
    
    Peep.new(id: result[0]['id'], message: result[0]['peep'], timestamp: result[0]['created_at'])
  end

  def peeped_at
    result = DateTime.parse(@timestamp)
    result.strftime('%H:%M on %d/%m/%y')
  end
end
