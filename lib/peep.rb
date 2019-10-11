class Peep

  attr_reader :message, :id

  def initialize(id:, message:)
    @message = message
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |message| message['message'] }
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;")

    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end
end
