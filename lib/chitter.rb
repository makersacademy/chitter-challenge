require_relative 'database'

class Chitter

  def self.all 
    get_all_posts = DataBase.query("SELECT * FROM posts;")
    get_all_posts.entries
  end

  def self.create(text)
    DataBase.query("INSERT INTO posts (post) VALUES ('#{text}') RETURNING id, post, created_at;")
  end

  def self.reverse_all
    result = DataBase.query("SELECT id, post, created_at FROM posts ORDER BY created_at DESC;")
    result.entries
  end

end
