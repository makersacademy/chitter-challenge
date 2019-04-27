require 'pg'

class Post

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end

    connection.exec("INSERT INTO posts (message) VALUES ('#{message}') RETURNING id, message")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
    
    result = connection.exec("SELECT * FROM posts")

    result.map { |post| post['message'] }
  end

end
