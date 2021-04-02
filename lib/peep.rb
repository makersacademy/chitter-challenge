require "pg"

class Peep

  attr_reader :id, :message, :time, :user_email

  def initialize(id:, message:, time:, user_email:)
    @id = id
    @message = message
    @time = time
    @user_email = user_email
  end

  def self.all
    result = connect_to_db.exec("SELECT * FROM messages ORDER BY id desc;")
    result.map { |post| Peep.new(id: post["id"], message: post["message"], time: Time.parse(post["date_time_stamp"]), user_email: post["user_email"]) }
  end

  def self.create(message:, user_email:)
    result = connect_to_db.exec("INSERT INTO messages (message, user_email) VALUES ('#{message}', '#{user_email}') RETURNING id, message, date_time_stamp, user_email;")
    Peep.new(id: result.first["id"], message: result.first["message"], time: Time.parse(result.first["date_time_stamp"]), user_email: result.first["user_email"])
  end

  def self.connect_to_db
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "message_manager_test")
    else
      connection = PG.connect(dbname: "message_manager")
    end
  end
end