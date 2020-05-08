require 'pg'

class MakerSignUp

  attr_reader :username, name:, email:

  def initialize(username:, name:, email:, password:)
    @username = username
    @name = name
    @email = email
    @password = password
  end

 def self.sign_up(name:, username:, email:, password:)
  if ENV['ENVIRONMENT'] == "test"
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end

  result = connection.exec("INSERT INTO profile (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}',
  '#{password}') RETURNING username, name, email, password)"
  Maker.new(id: result[0]['username'], result[0]['name'], result[0]['email'], result[0]['password'] )
end
end
