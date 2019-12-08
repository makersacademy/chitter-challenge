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
  
    # using bind params; telling the db which info comes from me, which info comes from the user
    # then i tell it how to bind them
    # this protects against sql injection
    connection.prepare('statement1', 'INSERT INTO messages (msg) VALUES($1) RETURNING id, msg')
    result = connection.exec_prepared('statement1', [msg])

    Message.new(id: result[0]['id'], msg: result[0]['msg'])
  
  end
  
end
