require "pg"

class Peep

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = connect_to_db.exec("SELECT * FROM messages ORDER BY id desc;")
    result.map { |post| Peep.new(id: post["id"], message: post["message"], time: Time.parse(post["date_time_stamp"])) }
  end

  def self.create(message:)
    result = connect_to_db.exec("INSERT INTO messages (message) VALUES ('#{message}') RETURNING id, message, date_time_stamp;")
    Peep.new(id: result.first["id"], message: result.first["message"], time: Time.parse(result.first["date_time_stamp"]))
  end

  def self.connect_to_db
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "message_manager_test")
    else
      connection = PG.connect(dbname: "message_manager")
    end
  end
end