require 'pg'

class Post
  def self.all
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')     
    end

    result = connection.exec("SELECT * FROM post;")
    result.map { |post| post['content']}
  end
end
