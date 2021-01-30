require 'pg'

class User

  attr_reader :id, :username, :password, :email

  def initialize(id:, username:, password:, email:)

    @id = id
    @username = username
    @password = password
    @email = email

  end

  def self.create_user(username:, password:, email:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (username, password, email) VALUES('#{username}', '#{password}', '#{email}') RETURNING id, username, password, email;")
    user = User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])

    # TEST
    p user.id
    p user.username
    p user.password
    p user.email

    return user

  end

end
