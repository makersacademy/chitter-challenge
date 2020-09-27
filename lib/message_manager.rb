require "pg"

class MessageManager
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map { |message|
      Message.new(message["content"])
    }
  end

  def self.store(message)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("INSERT INTO messages (content) VALUES ('#{message}');")
  end
end
