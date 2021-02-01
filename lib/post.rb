class Post

  def initialize()

  def self.load(limit)
    posts = DatabaseConnection.query("SELECT * FROM posts LIMIT #{limit};")
  end

  def self.post(user_id: user_id, body: body)
    DatabaseConnection.query("INSERT INTO posts (user_id, body) VALUES('#{user_id}', '#{body}') RETURNING body;")
  end

end
