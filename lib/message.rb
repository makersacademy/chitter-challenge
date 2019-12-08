require 'pg'
require './spec/database_helpers'

class Message

  attr_reader :id, :msg, :user_id, :ts

  def initialize(id:, msg:, user_id:, ts:)
    @id = id
    @msg = msg
    @user_id = user_id
    @ts = ts
  end

  def self.all

    connection = get_db_connection

    result = connection.exec("SELECT * FROM messages ORDER BY ts DESC;")
    result.map { |message| Message.new(id: message['id'], msg: message['msg'], 
      user_id: message['user_id'], ts: message['ts']) }
  end 

  def self.create(msg:, user_id:)

    connection = get_db_connection
  
    # using bind params; telling the db which info comes from me, which info comes from the user
    # then i tell it how to bind them
    # this protects against sql injection
    connection.prepare('statement1', 'INSERT INTO messages (msg, user_id, ts) VALUES($1, $2, $3) 
      RETURNING id, msg, user_id, ts')
    result = connection.exec_prepared('statement1', [msg, user_id, Time.now])

    Message.new(id: result[0]['id'], msg: result[0]['msg'], user_id: result[0]['user_id'], ts: result[0]['ts'])
  end
  
end
