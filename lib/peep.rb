class Peep
  attr_reader :body, :created_at, :user_id
  
  def initialize(id:, body:, created_at:, user_id:)
    @id = id
    @body = body
    @created_at = created_at
    @user_id = user_id
  end
  
  def self.all
    response = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    response.map { |row| new(id: row['id'], body: row['body'], created_at: convert_time(row['created_at']), user_id: row['user_id']) }
  end

  def self.convert_time(string_time)
    Time.strptime(string_time, '%Y-%m-%d %H:%M:%S.%N%z')
  end

  def author
    response = DatabaseConnection.query("SELECT username FROM users WHERE id=#{@user_id}")
    response[0]['username']
  end
end
