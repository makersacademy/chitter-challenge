require 'pg'
require 'uri'
require_relative 'user'
require_relative 'database_connection'

class Chitter
  attr_reader :id, :message, :nickname, :post_time

  def initialize(id:, message:, nickname:, post_time:)
    @id = id
    @message = message
    @nickname = nickname
    @post_time = post_time
  end

  def self.open
    DatabaseConnection.query("SELECT * FROM messages ORDER BY post_time DESC;")
  end

  def self.create(nickname, message, post_time)
    result = DatabaseConnection.query(
      "INSERT INTO messages
      (nickname, message, post_time)
      VALUES('#{nickname}','#{message}','#{post_time}')
      RETURNING id, nickname, message, post_time;"
    )
    Chitter.new(
      id: result[0]['id'],
      nickname: result[0]['nickname'],
      message: result[0]['message'],
      post_time: result[0]['post_time']
    )
  end

end
