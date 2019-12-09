require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :message, :created, :user_id

  def initialize(id:, message:, created:, user_id:)
    @id = id
    @message = message
    @created = created
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['text'], 
      created: peep['created'], user_id: peep['user_id'])
    end
  end

  def self.create(message:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO messages(text, user_id) VALUES('#{message}', '#{user_id}') 
      RETURNING id, text, created, user_id;"
      )
    Peep.new(id: result[0]['id'], message: result[0]['text'], 
    created: result[0]['created'], user_id: result[0]['user_id'])
  end

  def username
    User.find(id: user_id).username
  end

  def name
    User.find(id: user_id).name
  end

end
