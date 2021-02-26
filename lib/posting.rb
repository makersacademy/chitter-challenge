require 'pg'

class Posts
  def self.all
    connection = PG.connect(dbname: 'Chitter')
    result = connection.exec("SELECT * FROM posts;")
    result.map { |chitter| post['post'] }
  end
end
