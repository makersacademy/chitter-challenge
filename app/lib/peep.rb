class Peep
  attr_reader :id, :time, :content, :user_id, :username

  class << self
    def create(content:, user_id:)
      row = DatabaseConnection.query(
        "INSERT INTO peeps (content, user_id)
        VALUES ('#{content}', #{user_id}) RETURNING *;"
      ).first

      new(id: row['id'], time: row['time'], content: row['content'],
        user_id: row['user_id'])
    end

    def all
      result = DatabaseConnection.query("SELECT * FROM peeps;")
      result.map do |row|
        new(id: row['id'], time: row['time'], content: row['content'],
          user_id: row['user_id'])
      end
    end
  end

  def initialize(id:, time:, content:, user_id:)
    @id       = id
    @time     = time
    @content  = content
    @user_id  = user_id
    @username = find_username
  end

  private

  def find_username
    DatabaseConnection.query(
      "SELECT username FROM users
      INNER JOIN peeps ON users.id = peeps.user_id
      WHERE user_id = #{user_id};"
    ).first['username']
  end
end
