require 'pg'

class User

  attr_reader :id, :email, :username, :name

  def self.sign_up(email, password, name, username)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_manager_test')
    else
      conn = PG.connect(dbname: 'chitter_manager')
    end
    # result = conn.exec("SELECT email, username FROM users WHERE email = '#{email}' or username = '#{username}';")
    # raise 'email or username already taken!' if result != nil
    result = conn.exec("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, username, name;")
    @user = User.new(result[0]['id'], result[0]['email'], result[0]['username'], result[0]['name'])
  end

  def self.instance
    @user
  end

  def initialize(id, email, username, name)
    @id = id
    @username = username
    @email = email
    @name = name
  end

  # def check_details
  #   if ENV['ENVIRONMENT'] == 'test'
  #     conn = PG.connect(dbname: 'chitter_manager_test')
  #   else
  #     conn = PG.connect(dbname: 'chitter_manager')
  #   end
  #   result = conn.exec("SELECT * FROM users")
  #   result.map{ |user| raise 'email or username already taken!' if user['username'] == @username || user['email'] == @email  }
  # end

end
