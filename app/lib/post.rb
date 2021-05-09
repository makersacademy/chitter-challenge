class Post
  attr_reader :id, :time, :content, :user_id

  class << self
    def create(content:, user_id:)
      sql_string = [
        "INSERT INTO posts (content, user_id) ",
        "VALUES ($$#{content}$$, #{user_id}) RETURNING *;"
      ].join

      build(query(sql_string)[0])
    end

    def all
      result = query("SELECT * FROM posts;")
      result.map { |row| build(row) }
    end

    def delete(id:)
      query("DELETE FROM posts WHERE id = #{id};")
    end

    def find(id:)
      build(query("SELECT * FROM posts WHERE id = #{id};")[0])
    end

    def update(id:, content:)
      query("UPDATE posts SET content = $$#{content}$$ WHERE id = #{id};")
    end

    def user_posts(user_id:)
      result = query("SELECT * FROM posts WHERE user_id = #{user_id};")
      result.map { |row| build(row) }
    end

    private

    def build(data)
      new(id: data['id'], time: data['time'],
        content: data['content'], user_id: data['user_id'])
    end

    def query(sql_string)
      DatabaseConnection.query(sql_string)
    end
  end

  def initialize(id:, time:, content:, user_id:)
    @id       = id
    @time     = time
    @content  = content
    @user_id  = user_id
  end

  def names
    sql_string = [
      "SELECT name, username FROM users INNER JOIN posts ON users.id = ",
      "posts.user_id WHERE user_id = #{user_id};"
    ].join

    DatabaseConnection.query(sql_string)[0]
  end
end
