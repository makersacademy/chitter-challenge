require 'pg'
require './spec/database_helpers'

class Message

  attr_reader :id, :msg, :ts

  def initialize(id:, msg:, ts:)
    @id = id
    @msg = msg
    @ts = ts
  end

  def self.all

    connection = get_db_connection

    result = connection.exec("SELECT * FROM messages ORDER BY ts DESC;")
    result.map { |message| Message.new(id: message['id'], msg: message['msg'], ts: message['ts']) }
  end 

  def self.create(msg:)

    connection = get_db_connection
  
    # using bind params; telling the db which info comes from me, which info comes from the user
    # then i tell it how to bind them
    # this protects against sql injection
    connection.prepare('statement1', 'INSERT INTO messages (msg, ts) VALUES($1, $2) 
      RETURNING id, msg, ts')
    result = connection.exec_prepared('statement1', [msg, Time.now])

    Message.new(id: result[0]['id'], msg: result[0]['msg'], ts: result[0]['ts'])
  end
  
end
