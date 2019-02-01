class User
  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.list
    Database.query( "SELECT * FROM users" ).map do | row |
      User.new(id: row['id'], username: row['username'], password: row['password'])
    end
  end

  def self.add(username:, password:)
    result = Database.query( "INSERT INTO users(username, password) VALUES('#{username}', '#{password}' ) RETURNING id, username, password;")
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end
end
