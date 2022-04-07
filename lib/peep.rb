require_relative 'database_connection'

class Peep
  attr_reader :id, :peep, :timestamp, :user_id

  def initialize(id:, peep:, timestamp:, user_id:)
    @id = id
    @peep = peep
    @timestamp = timestamp
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC;")
    result.map do |message| 
      Peep.new(
        id: message['id'], 
        peep: message['peep'], 
        timestamp: message['created_at'],
        user_id: message['user_id'].to_i
      ) 
    end
  end

  def self.post(peep:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep, user_id) VALUES($1, $2) RETURNING id, peep, created_at, user_id", [peep, user_id]
    )
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: result[0]['created_at'], user_id: (result[0]['user_id']).to_i)
  end
end
