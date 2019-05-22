œclass Message
  attr_reader :text, :id, :date, :user_id, :username
  def initialize(id:, text:, date:, user_id:)
    @id = id
    @text = text
    @date = date
    @user_id = user_id
    # @username = username
  end

  def self.create(text:, user_id: -1)
    results = DatabaseConnection.query("INSERT INTO messages (text, user_id) VALUES ('#{text}', '#{user_id}') RETURNING id, text, date, user_id;")
    Message.new(id: results[0]['id'], text: results[0]['text'], date: results[0]['date'], user_id: results[0]['user_id'])
  end

  def self.all
    # results = DatabaseConnection.query("SELECT messages.*, users.username FROM messages, users WHERE messages.user_id = users.id;")
    results = DatabaseConnection.query("SELECT * FROM messages ORDER BY date DESC;")
    results.map { |message| Message.new(id: message['id'], text: message['text'], date: message['date'], user_id: message['user_id']) }
  end

  def self.update(text:, id:)
    DatabaseConnection.query("UPDATE messages SET text = '#{text}' WHERE id = #{id};")
  end
end
