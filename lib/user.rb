class User
  attr_reader :id, :username
  
  def self.create(name:, username:, email:, password:)
    persisted = DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, username;").first
    new(id: persisted['id'], username: persisted['username'])
  end

  private

  def initialize(id:, username:)
    @id = id
    @username = username
  end
end
