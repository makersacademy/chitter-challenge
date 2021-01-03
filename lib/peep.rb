require "pg"

class Peep
  attr_reader :id, :message, :time, :name, :user_name

  def initialize(id:, message:, time:, user_id:, user_class: User)
    @id = id
    @message = message
    @time = time
    @name = user_class.find(user_id).name
    @user_name = user_class.find(user_id).user_name
  end

  def self.create(message:, user_id:)
    return nil unless user_id
    
    result = DatabaseConnection.query("INSERT INTO peeps (message, user_id) VALUES ('#{message}', '#{user_id}') RETURNING id, message, date_time_stamp, user_id;").first
    Peep.new(id: result["id"], message: result["message"], time: Time.parse(result["date_time_stamp"]), user_id: result["user_id"])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id desc;")
    @peeps = result.map { |row|
      Peep.new(id: row["id"], message: row["message"], time: Time.parse(row["date_time_stamp"]), user_id: row["user_id"])
    }
  end
end
