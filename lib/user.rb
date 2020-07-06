class User
  attr_reader :id, :name, :email, :password

  def initialize(id, name, email, password)
    @id       = id
    @name     = name
    @email    = email
    @password = password
  end

  def self.create(name:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password)
      VALUES('#{name}', '#{email}', '#{password}')
      RETURNING id, name, email, password;")

    instance(result[0])
  end

  def self.authenticate(email:, password:)
    users = DatabaseConnection.query("SELECT * FROM users")

    users.each do |user|
      return instance(user) if user['email'] == email && user['password'] == password
    end

    false
  end

  def self.instance(user)
    User.new(user['id'], user['name'], user['email'], user['password'])
  end

  private_class_method :instance
end
