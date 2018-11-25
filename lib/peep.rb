require_relative './database_connection'
require 'uri'

class Peep

  attr_reader :id, :message, :created_at

  def initialize(id:, message:, created_at:, user_id:)
    @id = id
    @message = message
    @created_at = created_at
    @user_id = user_id

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
      id: peep['id'],
      message: peep['message'],
      created_at: peep['created_at'],
      user_id: peep['user_id']
      )
    end
  end

  def self.create(message:, created_at:)
    result = DatabaseConnection.query("INSERT INTO peeps
      (message, created_at) VALUES('#{message}', '#{created_at.strftime("%Y-%m-%d %k:%M")}')
      RETURNING id, message, created_at, user_id;")
    Peep.new(
      id: result[0]['id'],
      message: result[0]['message'],
      created_at: result[0]['created_at'],
      user_id: result[0]['user_id']
    )
  end
end
