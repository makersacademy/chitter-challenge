require 'pg'
class User
  attr_reader :first_name, :last_name, :username, :email, :id

  def initialize(username:, first_name:, last_name:, email:, id:)
    @user_name = user_name
    @first_name = first_name
    @last_name = last_name
    @email = email
    @id = id
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (first_name, last_name, username, email, password) VALUES( '#{params['first_name']}', '#{params['last_name']}', '#{params['username']}', '#{params['email']}', '#{params['password']}')")
  end

  self.find(params)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  result = connection.exec("SELECT * FROM users WHERE username = '#{params['username']}' AND password = '#{params['password']}'")
    User.new(
      username: result[0]['username'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
      id: result[0]['id']
    )
  end
end