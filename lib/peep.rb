require_relative 'database_connection'

class Peep 
  attr_reader :id, :message, :timestamp, :user_id
  def initialize(id:,message:,timestamp:,user_id:)
    @id = id
    @message = message
    @timestamp = timestamp
    @user_id = user_id
  end

  def self.create(message:, user_id:)
    current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    result = DatabaseConnection.query(
      "INSERT INTO peeps(message,timestamp,user_id) VALUES($1,$2,$3) RETURNING id, message, timestamp, user_id;", 
      [message,current_time,user_id])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps INNER JOIN users ON peeps.user_id = users.id
      ORDER BY peeps.id DESC;")
    
    result.map { |peep| Peep.new(id: peep['id'], message: peep['message'], timestamp: peep['timestamp'], user_id: peep['user_id']) }    
  end

end
