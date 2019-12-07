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
    result.map { |message| Message.new(id: message ['id'], msg: message['msg']) }
  end 
  
end