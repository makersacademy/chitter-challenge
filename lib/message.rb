require 'pg'

class Message

  attr_reader :message
  attr_accessor :all_messages

  def initialize(message)
    @message = message
    @all_messages = ["Hi y'all"]
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec('SELECT * FROM messages;')
    result.map { |row| row['content'] }
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO messages (content) VALUES('#{content}');")
  end
end