require_relative 'database_connection'
require 'date'

class Peep
  attr_reader :id, :user_id, :content, :created_on

  def self.create(user_id:, content:)
    peep = DatabaseConnection.query("INSERT INTO peeps (user_id, content, created_on) VALUES('#{user_id}', '#{content}', '#{DateTime.now.iso8601(6)}') RETURNING id, user_id, content, created_on;")
    Peep.new(id: peep[0]['id'], user_id: peep[0]['user_id'], content: peep[0]['content'], created_on: peep[0]['created_on'])
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_on DESC;")
    peeps.map do |peep|
      Peep.new(id: peep['id'], user_id: peep['user_id'], content: peep['content'], created_on: peep['created_on'])
    end
  end

  def initialize(id:, user_id:, content:, created_on:)
    @id = id
    @user_id = user_id
    @content = content
    @created_on = DateTime.parse(created_on).strftime('%H:%M %d %b %Y')
  end
end
