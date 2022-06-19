require 'pg'

class User

  attr_reader :username, :email

  def initialize(username:, email:)
    @username = username
    @email = email
  end

  def self.create(username)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    connection.exec("INSERT INTO users (username, email) VALUES ('Godzilla', 'godzilla@email.com');")
    result = connection.exec("SELECT * FROM users;")

    user = result.map { |user|
      User.new(username: user['username'],
      email: user['email'])
    }
    user.to_s
    
  end
end
