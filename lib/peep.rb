class Peep

  attr_reader :message, :id, :name, :handle

  def initialize(id:, name:, handle:, message:)
    @name = name
    @handle = handle
    @message = message
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |message|
      Peep.new(id: message['id'], name: message['name'], handle: message['handle'], message: message['message'])
    end.reverse 
  end

  def self.create(name:, handle:, message:)
    result = DatabaseConnection.query("INSERT INTO peeps (name, handle, message) VALUES('#{name}', '#{handle}', '#{message}') RETURNING id, name, handle, message;")

    Peep.new(id: result[0]['id'], name: result[0]['name'], handle: result[0]['handle'], message: result[0]['message'])
  end
end
