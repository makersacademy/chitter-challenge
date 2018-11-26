require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :timestamp, :name, :username

  def initialize(id:, content:, timestamp:, name:, username:)
    @id = id
    @content = content
    @timestamp = timestamp
    @name = name
    @username = username
  end

  def self.create(user_id:, content:)
    DatabaseConnection.query("INSERT INTO peeps (user_id, content)
                              VALUES('#{user_id}', '#{content}')
                              RETURNING id, user_id, content;")
  end

end
