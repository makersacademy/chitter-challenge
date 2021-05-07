class Peep
  attr_reader :id, :time, :content, :user_id, :username, :name

  class << self
    def create(content:, user_id:)
      content.gsub!(/'/, "''")
      row = DatabaseConnection.query(
        "INSERT INTO peeps (content, user_id)
        VALUES ('#{content}', #{user_id}) RETURNING *;"
      )
      build(row[0])
    end

    def all
      result = DatabaseConnection.query("SELECT * FROM peeps;")
      result.map { |row| build(row) }
    end

    def delete(id:)
      DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id};")
    end

    def find(id:)
      row = DatabaseConnection.query(
        "SELECT * FROM peeps WHERE id = #{id};"
      )
      build(row[0])
    end

    def update(id:, content:)
      content.gsub!(/'/, "''")
      DatabaseConnection.query("UPDATE peeps SET content = '#{content}'
        WHERE id = #{id};")
    end

    def my_peeps(user_id:)
      result = DatabaseConnection.query("SELECT * FROM peeps
        WHERE user_id = #{user_id};")
      result.map { |row| build(row) }
    end

    private

    def build(row)
      new(id: row['id'], time: row['time'],
        content: row['content'], user_id: row['user_id'])
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
