class Peep
  attr_reader :id, :time, :content, :user_id, :username, :name

  class << self
    def create(content:, user_id:)
      content.gsub!(/'/, "''")
      create_query = [
        "INSERT INTO peeps (content, user_id) ",
        "VALUES ('#{content}', #{user_id}) RETURNING *;"
      ].join
      build(query(create_query)[0])
    end

    def all
      result = query("SELECT * FROM peeps;")
      result.map { |row| build(row) }
    end

    def delete(id:)
      query("DELETE FROM peeps WHERE id = #{id};")
    end

    def find(id:)
      build(query("SELECT * FROM peeps WHERE id = #{id};")[0])
    end

    def update(id:, content:)
      content.gsub!(/'/, "''")
      query("UPDATE peeps SET content = '#{content}' WHERE id = #{id};")
    end

    def my_peeps(user_id:)
      result = query("SELECT * FROM peeps WHERE user_id = #{user_id};")
      result.map { |row| build(row) }
    end

    private

    def build(row)
      new(id: row['id'], time: row['time'],
        content: row['content'], user_id: row['user_id'])
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
    @username = find_names['username']
    @name     = find_names['name']
  end

  private

  def find_names
    DatabaseConnection.query(
      "SELECT name, username FROM users
      INNER JOIN peeps ON users.id = peeps.user_id
      WHERE user_id = #{user_id};"
    ).first
  end
end
