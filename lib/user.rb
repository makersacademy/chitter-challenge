require 'pg'

class User
  attr_reader :name, :user_name, :email, :password

  def initialize(name:, user_name:, email:, password:)
    @name = name
    @user_name = user_name
    @email = email
    @password = password
  end

  def self.create(name:, user_name:, email:, password:)
    connection = PG.connect(dbname: 'twitter_clone')
    result = connection.exec("INSERT INTO users (name, user_name, email, password) VALUES('#{name}', '#{user_name}', '#{email}', '#{password}') RETURNING user_name, name;")
    User.new(name: result[0]['name'], user_name: result[0]['user_name'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.all
    connection = PG.connect(dbname: 'twitter_clone')
    users = connection.exec('SELECT * FROM users;')
    users.map { |user| user['email'] }
  end

end
