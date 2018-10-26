require 'pg'
require 'date'

class Message

  attr_reader :id, :message, :time
  def initialize(id:, message:, time:)
    @message = message
    @time = time
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| Message.new(id: peep['id'], message: peep['message'], time: peep['time']) }.reverse
  end

  def self.create(message:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    result = connection.exec("INSERT INTO peeps (message, time) VALUES('#{message}', '#{time}') RETURNING id, message, time")
    Message.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end

  def timestamp
    Time.now.strftime '%H:%M:%S'
  end
end
