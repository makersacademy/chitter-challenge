require "pg"

class Peep
  attr_reader :id, :message, :time, :user_name

  def initialize(id:, message:, time:, user_id:, user_class: User)
    @id = id
    @message = message
    @time = time
    @user_id = user_id
    @user_class = user_class
    @user_name = user_class.find_name(user_id)
  end

  def self.create(message:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, user_id) VALUES ('#{message}', '#{user_id}') RETURNING id, message, date_time_stamp, user_id;")
    Peep.new(id: result.first["id"].to_i, message: result.first["message"], time: Time.parse(result.first["date_time_stamp"]), user_id: result.first["user_id"].to_i)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id desc;")
    @peeps = result.map { |row|
      Peep.new(id: row["id"].to_i, message: row["message"], time: Time.parse(row["date_time_stamp"]), user_id: row["user_id"].to_i)
    }
  end
end
