require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :username

  def initialize(id:, content:, username:)
    @id = id
    @content = content
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], content: peep['content'])
    end
  end

  def self.create(content:, username:)
    result = DatabaseConnection.query("INSERT INTO peeps (content, username) VALUES('#{content}', '#{username}') RETURNING id, content, username;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], content: result[0]['content'])
  end
end
