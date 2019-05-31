require './lib/database_connection'

class Peep

  attr_reader :user_id, :peep, :timestamp, :username
  
  def initialize(user_id:, peep:, timestamp:, username:)
    @user_id = user_id
    @peep = peep
    @timestamp = timestamp
    @username = username
  end

  def self.create(user_id:, peep:)
    time = Time.now.strftime("%Y-%m-%d %H:%M")
    formatted_peep = peep.gsub(/'/, "''")

    sql = "INSERT INTO peeps (user_id, peep, timestamp) VALUES('#{user_id}', '#{formatted_peep}', '#{time}') RETURNING id, user_id, peep, timestamp;"
    result = DatabaseConnection.query(sql)
    Peep.new(
      user_id: result[0]["user_id"],
      username: nil,
      peep: result[0]["peep"],
      timestamp: result[0]['timestamp']
    )
  end

  # this returns an element from user class. to be encapsulated
  def self.all
    sql = "SELECT users.username, users.id, peeps.peep, peeps.timestamp
            FROM peeps JOIN users ON peeps.user_id = users.id
            ORDER BY peeps.timestamp DESC
          ;"
    result = DatabaseConnection.query(sql)
    
    result.map do |peep|
      Peep.new(
        user_id: peep["id"],
        username: peep["username"],
        peep: peep["peep"],
        timestamp: peep['timestamp']
      )
    end
  end
end