require 'pg'

class User
  attr_reader :name, :username, :email, :password, :user_list

  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.add(name, username, email, password)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO user_info (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING name, username, email, password;")
    User.new(result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
    p @user_list=[]
    p @user_list << result
  end

end
