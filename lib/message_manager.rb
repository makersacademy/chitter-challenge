require "pg"
require "date"

class MessageManager
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    connection.type_map_for_results = PG::BasicTypeMapForResults.new connection

    result = connection.exec("SELECT * FROM messages ORDER BY time DESC;")
    result.map { |message|
      Message.new(message.values[1], message.values[2], message.values[0])
    }
  end

  def self.store(message)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    connection.exec("INSERT INTO messages (content, time) VALUES ($1, $2);", [message.content, message.time.strftime("%FT%T.%L%z")])
  end
end
