require 'pg'

class Message
  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'chitter_chatter_test')
  else
    @connection = PG.connect(dbname: 'chitter_chatter')
  end

  attr_reader :id, :title, :body, :created_at

  def initialize(id:, title:, body:, created_at:)
    @id = id
    @title = title
    @body = body
    @created_at = created_at
  end

  def self.add(body:, title:)
    result = @connection.exec("INSERT INTO messages (body, title)"\
                              " VALUES('#{body}', '#{title}')"\
                              " RETURNING id, title, body, created_at;")
    Message.new(id: result[0]['id'], title: result[0]['title'],
                body: result[0]['body'], created_at: result[0]['created_at'])
  end

  def self.all
    result = @connection.exec("SELECT * FROM messages ORDER BY ID DESC;")
    result.map do |message|
      Message.new(id: message['id'], title: message['title'],
                  body: message['body'], created_at: message['created_at'])
    end
  end

end
