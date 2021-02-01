require_relative './database_connection'
require 'pg'

class Peep

  attr_reader :id, :text, :created_at, :user_id

  def initialize(id:, text:, created_at:, user_id:)
    @id = id
    @text = text
    @created_at = created_at
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at desc")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'],
        created_at: peep['created_at'],
        user_id: peep['user_id'])
    end
  end

  def self.create(text:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps(text, user_id)
      VALUES('#{text}', '#{user_id}')
      RETURNING id, text, created_at, user_id;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      created_at: result[0]['created_at'],
      user_id: result[0]['user_id']
    )
  end
end
