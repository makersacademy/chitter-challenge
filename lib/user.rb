require_relative "database_manager"

class User
  attr_reader :id, :email, :password, :name, :username

  def self.all
    select_all.map do |user|
      User.new(
        id: user['id'], email: user['email'], password: user['password'],
        name: user['name'], username: user['username']
      )
    end
  end

  def self.create(email, password, name, username)
    DatabaseManager.query("INSERT INTO users(email,password,name,username)" \
      "VALUES('#{email}','#{password}', '#{name}', '#{username}') " \
      "RETURNING id, email, password, name, username")
  end

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.select_all
    DatabaseManager.query('SELECT * FROM users')
  end

  private_class_method :select_all
end
