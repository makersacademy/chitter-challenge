require 'pg'

class Messages
  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'chitter_test')
  else
    @connection = PG.connect(dbname: 'chitter')
  end

  attr_reader :id, :username, :name, :message, :time

  def initialize(id:, username:, name:, message:, time:)
    @id  = id
    @username = username
    @name = name
    @message = message
    @time = time
  end

  def self.create(username:, name:, message:)
    result = @connection.exec("INSERT INTO messages (username, name, message) VALUES('#{username}', '#{name}', '#{message}') RETURNING id, username, name, message, time;")
    Messages.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'],message: result[0]['message'], time: result[0]['time'])
  end

  def self.all
    result = @connection.exec("SELECT * FROM messages;")
    result.map do |message|
      Messages.new(id: message['id'], username: message['username'], name: message['name'],message: message['message'],time: message['time'])
    end
  end

end
