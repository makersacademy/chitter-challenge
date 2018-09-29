class Chat
  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT id, text, time FROM chats ORDER BY hidden_timestamp DESC')
    result.map { |chat| Chat.new(id: chat['id'], text: chat['text'], time: chat['time']) }
  end

  def self.add(text, time = Time.now)
    result = DatabaseConnection.query("INSERT INTO chats (text, time, hidden_timestamp) VALUES ('#{text}', '#{time.strftime("%I:%M%p on %d/%m/%Y")}', current_timestamp) RETURNING id, text, time;")

    Chat.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end
end
