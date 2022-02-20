require 'pg'

class Post
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM post;")
    result.map { |post| post['content']}
  end
end
