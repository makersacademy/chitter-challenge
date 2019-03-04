require 'pg'
require_relative 'peep'
require_relative 'database_connection'
require_relative 'user'

class Comment

  def self.create(peep_id:, user_id:, text:)
    result = DatabaseConnection.query("INSERT INTO comments (text, peep_id, user_id) VALUES('#{text}', '#{peep_id}', '#{user_id}') RETURNING id, text, peep_id, user_id;")
    Comment.new(
      id: result[0]['id'],
      text: result[0]['text'],
      peep_id: result[0]['peep_id'],
      user_id: result[0]['user_id']
    )
  end

  def self.where(peep_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE peep_id='#{peep_id}'")
    result.map do |comment|
      Comment.new(
        id: comment['id'],
        text: comment['text'],
        peep_id: comment['peep_id'],
        user_id: comment['user_id']
      )
    end
  end

  attr_reader :id, :text, :peep_id, :user_id

  def initialize(id:, text:, peep_id:, user_id:)
    @id = id
    @text = text
    @peep_id = peep_id
    @user_id = user_id
  end
end
