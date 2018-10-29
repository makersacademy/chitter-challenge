require 'pg'

class Message

  attr_reader :id, :message, :name, :time

  def initialize(id:, message:, name:, time:)
    @id  = id
    @message = message
    @name = name
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
      Message.new(id: msg['id'], message: msg['message'], name: msg['name'],time: msg['time'])
    end
  end

  def self.create(message:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    time_now = Time.new.strftime("%H:%M")
    result = connection.exec("INSERT INTO chitter (message, name, time) VALUES('#{message}', '#{name}', '#{time_now}') RETURNING id, message, name, time;")
    Message.new(id: result[0]['id'], message: result[0]['message'], name: result[0]['name'], time: result[0]['time'])
  end
end
