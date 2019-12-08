require 'pg'

class Message

  attr_reader :messages

  def initialize(message:)
    @messages = message
  end

  def self.post(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("insert into chitter(message) values('#{message}');")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    data = connection.exec('select * from chitter;')
    data.map {|post|
      Message.new(message: post['message'])}
  end

end
