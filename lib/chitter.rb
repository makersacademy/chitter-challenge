require 'pg'

class Chitter

  attr_reader :id, :chat_log

  def initialize(id:, chat_log:)
    @id  = id
    @chat_log = chat_log
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM chat_log;")
    result.map { |chitter| chitter['chat_log'] }
  end

  def self.create(chat_log:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    connection.exec("INSERT INTO chat_log (chat_log) VALUES('#{chat_log}}')")
  end
end