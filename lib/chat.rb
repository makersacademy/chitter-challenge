class Chat
  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM chats')
    result.map { |chat| Chat.new(id: chat['id'], text: chat['text']) }
  end

  def self.add(text)
    result = DatabaseConnection.query("INSERT INTO chats (text) VALUES ('#{text}') RETURNING id, text;")

    Chat.new(id: result[0]['id'], text: result[0]['text'])
  end
end
