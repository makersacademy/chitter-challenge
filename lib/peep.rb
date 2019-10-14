class Peep

  attr_reader :message, :id, :name, :handle, :timestamp

  def initialize(id:, name:, handle:, message:, timestamp:)
    @name = name
    @handle = handle
    @message = message.gsub("`apos*") {"'"}
    @id = id
    @timestamp = Time.parse(timestamp).strftime("%d/%m/%Y %H:%M")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |message|
      Peep.new(id: message['id'], name: message['name'], handle: message['handle'], message: message['message'], timestamp: message['created_at'])
    end.reverse
  end

  def self.create(name:, handle:, message:)
    result = DatabaseConnection.query("INSERT INTO peeps (name, handle, message) VALUES('#{name}', '#{handle}', '#{message.gsub("'") {"`apos*"}}') RETURNING id, name, handle, message, created_at;")

    Peep.new(id: result[0]['id'], name: result[0]['name'], handle: result[0]['handle'], message: result[0]['message'], timestamp: result[0]['created_at'])
  end
end
