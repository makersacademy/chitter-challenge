require 'pg'
class User
  attr_reader :first_name, :last_name, :username, :email, :password

  def initialize(username:, first_name:, last_name:, email:, password:)
    @user_name = user_name
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (first_name, last_name, username, email, password) VALUES( '#{params['first_name']}', '#{params['last_name']}', '#{params['username']}', '#{params['email']}', '#{params['password']}')")
  end

end