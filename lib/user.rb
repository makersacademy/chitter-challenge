class User

  attr_reader :id, :name, :username, :email

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name, username, email, password)
    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password)
     VALUES($1, $2, $3, $4) RETURNING id, name, username, email, password", [name, username, email, password])
    p result[0]
    User.new(result[0]["id"], result[0]["name"], result[0]["username"], result[0]["email"], result[0]["password"])
  end

end