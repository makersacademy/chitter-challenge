require 'pg'

class Message

  attr_reader :id, :content, :username, :time

  def initialize(id:, content:, username:, time:)
    @id = id
    @content = content
    @username = username
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM messages ORDER BY time DESC")
    result.map do |message|
      Message.new(id: message['id'], content: message['content'], username: message['username'], time: message['time'])
    end
  end

  def self.create(username:, content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params(
      "INSERT INTO messages (username, content) VALUES($1, $2) RETURNING id, content, username, time;", [username, content]
    )
  end 
end