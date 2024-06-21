# Peep class
require_relative 'database_connection'
require_relative 'user'

class Peep
  attr_reader :id, :text, :user_id, :created_at

  def initialize(id, text, user_id, created_at)
    @id = id
    @text = text
    @user_id = user_id
    @created_at = created_at
  end

  def self.create(text, user_id)
    result = DatabaseConnection.exec_params("INSERT INTO peeps (text, user_id) VALUES ($1, $2) RETURNING id, created_at", [text, user_id])
    id = result[0]["id"]
    date = result[0]["created_at"]
    Peep.new(id, text, user_id, date)
  end

  def self.all
    result = DatabaseConnection.exec_params("SELECT * FROM peeps ORDER BY id DESC", [])
    result.map do |peep_data|
      Peep.new(peep_data["id"], peep_data["text"], peep_data["user_id"], peep_data["created_at"])
    end
  end

  def user
    User.find_by_id(user_id)
  end
end