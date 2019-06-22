require 'pg'
require_relative 'user'

class Message

  attr_reader :message, :created_at, :username

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

  def self.create(user_message: , username:)
    created_at = Message.current_time
    database_connection.exec("INSERT INTO message (message, created_at, username) VALUES('#{user_message}', '#{created_at}', '#{username}') RETURNING message, created_at, username")
  end

  def self.all
    table_contents = database_connection.exec("SELECT * FROM message")
    array_of_messages = table_contents.map do |row|
      Message.new(message: row['message'], created_at: row['created_at'], username: row['username'])
    end
    array_of_messages.reverse
  end

  def initialize(message: ,created_at:, username:)
    @message = message
    @created_at = created_at
    @username = username
  end

  def find_user
    User.find_by_username(@username)
  end


end
