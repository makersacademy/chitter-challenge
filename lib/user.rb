class User

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    connection = database_setup
    result = connection.exec("INSERT INTO people (name, username, email, password) 
    VALUES('#{name}', '#{username}', '#{email}', '#{password}') 
    RETURNING id, name, username, email;")
    User.new(id: result[0]['id'], name: result[0]['name'], 
      username: result[0]['username'], email: result[0]['email'])
  end

end
