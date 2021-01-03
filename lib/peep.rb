require "pg"

class Peep
  attr_reader :id, :message, :time, :name, :user_name

  def initialize(id:, message:, time:, name:, user_name:)
    @id = id
    @message = message
    @time = time
    @name = name
    @user_name = user_name
  end

  def self.create(message:, user_id:)
    DatabaseConnection.query("INSERT INTO peeps (message, user_id) VALUES ('#{message}', '#{user_id}') RETURNING id, message, date_time_stamp, user_id;").first
  end

  def self.all
    result = DatabaseConnection.query("SELECT peeps.id, message, date_time_stamp, name, user_name FROM peeps INNER JOIN users ON peeps.user_id = users.id ORDER BY peeps.id desc;")
    @peeps = result.map { |row|
      Peep.new(id: row["id"], message: row["message"], time: Time.parse(row["date_time_stamp"]), name: row["name"], user_name: row["user_name"])
    }
  end
end
