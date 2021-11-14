require 'pg'

class Peep
  attr_reader :time, :message, :id

  def initialize(time:, message:, id:)
    @time = time
    @message = message
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec('SELECT * FROM peeps ORDER BY time DESC')
    result.map { |peep| [peep['time'], peep['message']] }
  end

  def self.create(message:)
    time =
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    connection.exec("INSERT INTO peeps (message, time) VALUES('#{message}', NOW()::timestamp(0))")
  end
end