require 'pg'

class User
  attr_reader :id, :name, :username

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.add(name, username, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password;")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  # def self.login(username)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'chitter_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter')
  #   end
  #   result = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
  #   User.new(result[0]['id'], result[0]['name'], result[0]['username'], nil, nil)
  #   # user.current_user
  # end
  # #
  # # def current_user
  # #   user.id
  # # end

end
