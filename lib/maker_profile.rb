require 'pg'

class MakerProfile

  attr_reader :username, :name, :email

  def initialize(username:, name:, email:, password:)
    @username = username
    @name = name
    @email = email
    @password = password
  end

 def self.signup(name:, username:, email:, password:)
  if ENV['ENVIRONMENT'] == "test"
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end

  result = connection.exec("INSERT INTO profile (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}',
  '#{password}') RETURNING username, name, email, password);")
  MakerSignUp.new(username: result[0]['username'], name: result[0]['name'], email: result[0]['email'],
    password: result[0]['password'])
 end

 def self.login
   if ENV['ENVIRONMENT'] == "test"
     connection = PG.connect(dbname: 'chitter_test')
   else
     connection = PG.connect(dbname: 'chitter')
   end
   result = connection.exec("SELECT * FROM profile WHERE username = '#{username}' AND password = '#{password}';")
end
