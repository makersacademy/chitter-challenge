require_relative 'database_connection'

class Peep
  attr_reader :id, :text, :timestamp, :user_id
  def initialize(id:, text:, timestamp:, user_id:)
    @id = id
    @text = text
    @timestamp = timestamp
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], 
      text: peep['text'], 
      timestamp: peep['timestamp'], 
      user_id: peep['user_id']
      ) 
    end
  end

  def self.create(text:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, timestamp, user_id) 
      VALUES ('#{text}', current_timestamp, '#{user_id}') RETURNING *;"
    )
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      timestamp: result[0]['timestamp'],
      user_id: result[0]['user_id']
    )
  end
end
