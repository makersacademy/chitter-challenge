require_relative 'database_connection'
require 'date'

class Peep
  attr_reader :id, :user_id, :content, :created_on

  def self.create(user_id:, content:)
    peep = DatabaseConnection.query("INSERT INTO peeps (user_id, content, created_on) VALUES('#{user_id}', '#{content}', '#{DateTime.now}') RETURNING id, user_id, content, created_on;")
    Peep.new(id: peep[0]['id'], user_id: peep[0]['user_id'], content: peep[0]['content'], created_on: peep[0]['created_on'])
  end

  def initialize(id:, user_id:, content:, created_on:)
    @id = id
    @user_id = user_id
    @content = content
    @created_on = created_on
  end
end
