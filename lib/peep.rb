require 'pg'

class Peep
  attr_reader :id, :username, :content, :timestamp

  def initialize(id:, username:, content:, timestamp:)
    @id = id
    @username = username
    @content = content
    @timestamp = timestamp
  end

  def self.create(username:, content:)
    ENV['ENV'] == 'test' ? database = 'chitter_test' : database = 'chitter'
    connection = PG.connect dbname: database
    result = connection.exec "INSERT INTO peeps (username, content)
                              VALUES('#{username}', '#{content}')
                              RETURNING id, username, content, timestamp;"
    Peep.new(id: result[0]['id'], username: result[0]['username'],
             content: result[0]['content'], timestamp: result[0]['timestamp'])
  end

end
