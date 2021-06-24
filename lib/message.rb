require 'pg'

class Message

  attr_reader :message, :created_at

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.current_time
    time = Time.new
    time.strftime("%k:%M")
  end

  def self.create(user_message: )
    created_at = Message.current_time
    database_connection.exec("INSERT INTO message (message, created_at) VALUES('#{user_message}', '#{created_at}') RETURNING message, created_at")
  end

  def self.all
    table_contents = database_connection.exec("SELECT * FROM message")
    array_of_messages = table_contents.map do |row|
      Message.new(message: row['message'], created_at: row['created_at'])
    end
    array_of_messages.reverse
  end

  def initialize(message: ,created_at:)
    @message = message
    @created_at = created_at
  end

end