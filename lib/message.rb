require 'pg'

class Message
  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'chitter_chatter_test')
  else
    @connection = PG.connect(dbname: 'chitter_chatter')
  end

  attr_reader :id, :title, :body

  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end

  def self.add(body:, title:)
    result = @connection.exec("INSERT INTO messages (body, title) VALUES('#{body}', '#{title}') RETURNING id, title, body;")
    Message.new(id: result[0]['id'], title: result[0]['title'], body: result[0]['body'])
  end

  def self.all
    result = @connection.exec("SELECT * FROM messages;")
    result.map do |message|
      Message.new(id: message['id'], title: message['title'], body: message['body'])
    end
  end
end