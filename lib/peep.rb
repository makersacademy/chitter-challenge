require 'pg'

class Peep
  attr_reader :id, :message, :time, :user_id

  def initialize(id:, message:, time:, user_id:)
    @id = id
    @message = message
    @time = time
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    result.map do |peep| 
      Peep.new(
        id: peep['id'], 
        message: peep['peep'], 
        time: peep['time'], 
        user_id: peep['user_id']
      ) 
    end
  end

  def self.post(peep:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep, user_id) VALUES($1, $2) RETURNING id, peep, time, user_id;", 
      [peep, user_id]
      )
    Peep.new(
      id: result[0]['id'], 
      message: result[0]['peep'], 
      time: result[0]['time'], 
      user_id: result[0]['user_id']
    )
  end

end
