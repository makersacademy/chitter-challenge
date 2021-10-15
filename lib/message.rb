require 'pg'

class Message

  attr_reader :id, :content, :user, :time

  def initialize(id:, content:, user:, time:)
    @id = id
    @content = content
    @user = user
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM messages")
    result.map do |message|
      Message.new(id: message['id'], content: message['content'], user: message['user'], time: message['time'])
    end
  end
end