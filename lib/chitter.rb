require_relative 'database'

class Chitter

  def self.all 
    DataBase.query("SELECT * FROM posts;")
  end

  def self.create(text, user_id, user_name)
    DataBase.query("INSERT INTO posts (post, user_id, user_name) VALUES ('#{text}', '#{user_id}', '#{user_name}') RETURNING id, post, created_at, user_id, user_name;")
  end

  def self.reverse_all
    DataBase.query("SELECT * FROM posts ORDER BY created_at DESC;")
  end

end
