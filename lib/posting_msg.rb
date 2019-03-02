require 'pg'

class Chat
  attr_reader :id, :nickname, :msg

  def initialize(id:, nickname:, msg:)
    @id = id
    @nickname = nickname
    @msg = msg
  end

  def self.add(nickname:, msg:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec(
      "INSERT INTO chat (nickname, msg) VALUES('#{nickname}', '#{msg}')
      RETURNING id, time, nickname, msg;"
    )
    Chat.new(id: result[0]['id'], nickname: result[0]['nickname'], msg: result[0]['msg'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM chat;')
    result.map do |chat|
      Chat.new(id: chat['id'], nickname: chat['nickname'], msg: chat['msg'])
    end
  end
end
