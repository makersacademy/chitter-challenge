require 'pg'

class Message
  attr_reader :msg_id, :username, :msg, :created_on

  def initialize(msg_id:, username:, msg:, created_on:)
    @msg_id = msg_id
    @username = username
    @msg = msg
    @created_on = created_on
  end

  def self.create(username:, msg:, created_on:)
    conn = connect
    query = <<-EOF
      INSERT INTO messages (username, msg, created_on)
      VALUES ($1, $2, $3) 
    EOF
    conn.exec(query, [username, msg, created_on])
  end

  def self.all
    conn = connect
    result = conn.exec('SELECT * FROM messages ORDER BY created_on DESC')
    result.map do |msg|
      Message.new(
        msg_id: msg['msg_id'],
        username: msg['username'],
        msg: msg['msg'],
        created_on: DateTime.strptime(
          msg['created_on'], '%Y-%m-%d %H:%M:%S'
        )
      )
    end
  end

  private_class_method def self.connect
    return PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'

    PG.connect(dbname: 'chitter')
  end
end
