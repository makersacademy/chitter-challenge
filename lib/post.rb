require 'pg'

class Post

  def self.create(message)
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec("INSERT INTO posts (message) VALUES ('#{message}') RETURNING id, message")
  end

  def self.all
    connection = PG.connect :dbname => 'chitter_test'
    result = connection.exec("SELECT * FROM posts")

    result.map { |post| post['message'] }
  end

end
