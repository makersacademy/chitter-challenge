require "pg"

class User
  attr_reader :name, :email, :password, :username
  
  def initialize(id:, name:, email:, password:, username:)
    @id = id
    @name = name
    @email = email
    @password = password
    @username = username
  end

  def self.create(name:, email:, password:, username:)
    if ENV['RACK_ENV'] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec(
      "INSERT INTO users (name, email, password, username)
      VALUES ('#{name}', '#{email}', '#{password}', '#{username}')
      ON CONFLICT DO NOTHING
      RETURNING id, name, email, password, username;"
    )

    return "Unique user error" if result.ntuples < 1
    
    User.new(
      id: result[0]["id"],
      name: result[0]["name"],
      email: result[0]["email"],
      password: result[0]["password"],
      username: result[0]["username"]
    )
  end

  def self.all
    if ENV['RACK_ENV'] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT * FROM users")
    result.map do |user|
      User.new(
        id: user["id"],
        name: user["name"],
        email: user["email"],
        password: user["password"],
        username: user["username"]
      )
    end
  end
end
