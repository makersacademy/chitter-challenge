require_relative 'database_connection'

class Peep
  attr_reader :id, :time, :message

  def initialize(id:, time:, message:)
    @id = id
    @time = time
    @message = message
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter;")

    result.map do |peep|
      Peep.new(id: result[0]["id"], time: peep["time"], text: peep["message"])
    end

  end

  def self.post(message:)
    result = DatabaseConnection.query(
      "INSERT INTO chitter (message) VALUES('#{message}') RETURNING message;",
    )

    Peep.new(id: result[0]["id"], created_at: result[0]["time"], text: result[0]["message"])
  end

end
