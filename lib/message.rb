require 'pg'

class Message

  attr_reader :message

  def initialize(message: )
    @message = message
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
  
  def self.create(user_message:)
    database_connection.exec("INSERT INTO message (message) VALUES('#{user_message}') RETURNING message")
  end

  def self.all
    table_contents = database_connection.exec("SELECT * FROM message")
    array_of_messages = table_contents.map do |row|
      Message.new(message: row['message'])
    end
    array_of_messages.reverse
  end

end