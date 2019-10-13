require 'pg'

class Message

  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)

    @id = id
    @text = text
    @time = time

  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    message = connection.exec("INSERT INTO message (text) VALUES ('#{text}') RETURNING id, text, time")

    Message.new(id: message[0]['id'], text: message[0]['text'], time: message[0]['time'])

  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM message ORDER BY time DESC")

    result.map do |message| 
      Message.new(id: message['id'], text: message['text'], time: message['time'])
    end

  end

end
