require 'pg'

class Peeps
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("SELECT * FROM peeps ORDER BY time DESC;")
    result.map do |peep| 
      Peeps.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    time = Time.now.strftime("%k:%M")
    result = connection.exec("INSERT INTO peeps (message, time) VALUES('#{message}', '#{time}') RETURNING id, message, time;")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end
end
