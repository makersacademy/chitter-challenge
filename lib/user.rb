class User

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    #Need to make the password secret
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, name, username;").first
    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], username: result["username"])
  end

  def self.find(id:)
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("SELECT * FROM users WHERE id = #{id};").first
    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], username: result["username"])
  end
end
