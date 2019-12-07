require 'pg'

class Message

  attr_reader :id, :msg, :ts

  def initialize
    @id = id
    @msg = msg
    @ts = Time.now.to_i
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| Message.new(id: message ['id'], msg: message['msg'], ts: message['ts']) }
  end 

  def self.create(msg:, ts:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("INSERT INTO messages (msg, ts) VALUES('#{msg}') RETURNING id, msg, ts")
    Message.new(id: result[0]['id'], msg: result[0]['msg'], ts: result[0]['ts'])
 
  
  end



  
end