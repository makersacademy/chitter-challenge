require 'pg'

class Post
  def self.all
    con = PG.connect(dbname: 'chitter')
    result = con.exec("SELECT * FROM posts;")
    result.map { |post| post['chit'] }
  end
end
