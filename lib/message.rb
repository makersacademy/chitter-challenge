require 'pg'

class Message

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id  = id
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM chitter;")
    result.map do |msg|
      Message.new(id: msg['id'], message: msg['message'], time: msg['time'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    time_now = Time.new.strftime("%H:%M")
    result = connection.exec("INSERT INTO chitter (message, time) VALUES('#{message}', '#{time_now}') RETURNING id, message, time;")
    Message.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end
end
