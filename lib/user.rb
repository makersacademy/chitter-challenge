require 'bcrypt'

class User 
  attr_reader :id, :name, :username, :email

  def initialize(id: , name: , username: , email: )
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name: , username: , email: , password: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    encrypted_password = BCrypt::Password.create(password)
    user = connection.exec("INSERT INTO users (user_name, username, email, user_password) VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}') RETURNING id, user_name, username, email;")
    User.new(id: (user[0]['id']),name: (user[0]['user_name']),username: (user[0]['username']), email: (user[0]['email']))
  end

  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return nil unless id
    result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: (result[0]['id']), name: (result[0]['user_name']),username: (result[0]['username']),email: (result[0]['email']))
  end

end