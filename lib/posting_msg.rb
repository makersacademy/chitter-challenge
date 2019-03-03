require 'pg'

class Chat
  attr_reader :id, :time, :nickname, :msg

  def initialize(id:, time:, nickname:, msg:)
    @id = id
    @time = time
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
    Chat.new(id: result[0]['id'], time: result[0]['time'], nickname: result[0]['nickname'], msg: result[0]['msg'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM chat ORDER BY time DESC;')
    result.map do |chat|
      Chat.new(id: chat['id'], time: chat['time'], nickname: chat['nickname'], msg: chat['msg'])
    end
  end
end
