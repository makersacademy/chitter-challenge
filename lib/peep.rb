require 'pg'

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
    ENV['ENV'] == 'test' ? database = 'chitter_test' : database = 'chitter'
    connection = PG.connect dbname: database
    result = connection.exec "INSERT INTO peeps (user_id, content)
                              VALUES('#{user_id}', '#{content}')
                              RETURNING id, user_id, content;"
  end

end
