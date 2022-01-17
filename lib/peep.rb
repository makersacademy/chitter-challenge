require 'pg'
require_relative 'database_connection'
require_relative 'user'

class Peep
  attr_reader :message, :id, :user_id

  def initialize(id:, message:, timestamp:, user_id:)
    @id = id
    @message = message
    @timestamp = timestamp
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY created_at DESC')

    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['peep'], timestamp: peep['created_at'], user_id: peep['user_id'])
    end
  end

  def self.create(message:, user_id:)
    result = DatabaseConnection.query(
"INSERT INTO peeps (peep, user_id) VALUES ($1, $2) RETURNING id, peep, created_at, user_id", [message, user_id])
    
    Peep.new(id: result[0]['id'], message: result[0]['peep'], timestamp: result[0]['created_at'], user_id: result[0]['user_id'])
  end

  def peeped_at
    result = DateTime.parse(@timestamp)
    result.strftime('%H:%M on %d/%m/%y')
  end

  def user_name
    result = DatabaseConnection.query("SELECT username FROM users WHERE id = $1", [@user_id])
  end
end
