require 'pg'

class Message

  attr_reader :id, :msg

  def initialize(id:, msg:)
    @id = id
    @msg = msg
    # @ts = Time.now.to_i
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT id, msg FROM messages;")
    result.map { |message| Message.new(id: message ['id'], msg: message['msg']) }
  end 

  def self.create(msg:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("INSERT INTO messages (msg) VALUES('#{msg}') RETURNING id, msg")
    Message.new(id: result[0]['id'], msg: result[0]['msg'])
  
  end



  
end