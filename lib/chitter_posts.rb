require 'pg'

class Posts
  def self.all
    connection = PG.connect(dbname: 'chitter_posts')
    result = connection.exec('SELECT * FROM posts')
    result.map { |posts| posts['posts'] }
  end
end