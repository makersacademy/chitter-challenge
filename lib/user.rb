require 'pg'

class User

  attr_reader :username, :email, :password

  def initialize(username:, email:, password:)
    @username = username
    @email = email
    @password = password
  end

  def self.create(username, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    connection.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{password}');")
    result = connection.exec("SELECT * FROM users;")

    user = result.map { |user|
      User.new(username: user['username'],
      email: user['email'],
      password: user['password']
    )
    }
    user.to_s
    
  end
end
