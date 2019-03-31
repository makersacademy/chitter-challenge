require 'pg'

class Message

  attr_reader :id, :username, :message, :time

  def initialize(id:, username:, message:, time:)
    @id = id
    @username = username
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map { |message|
      Message.new(
        id: message['id'],
        username: message['username'],
        message: message['message'],
        time: message['time']
      )
    }.reverse
  end

  def self.post(username:, message:)
    time = Time.new.strftime('%F  %k:%M:00')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec(
      "INSERT INTO messages (username, message, time) VALUES ('#{username}', '#{message}', '#{time}') RETURNING id, username, message, time;")
    Message.new(
      id: result[0]['id'],
      username: result[0]['username'],
      message: result[0]['message'],
      time: result[0]['time']
    )
  end
end
