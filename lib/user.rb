require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.all
    result = db_access.exec("SELECT * FROM users;")
    result.map do |user|
      new_instance_from(user_hash: user)
    end
  end

  def self.create(name:, email:, password:)
    encrypted_pw = BCrypt::Password.create(password)
    result = db_access.exec("INSERT INTO users (name, email, password) VALUES(
      '#{db_access.escape_string(name)}',
      '#{db_access.escape_string(email)}',
      '#{encrypted_pw}'
    ) RETURNING id, name, email, password;")
    new_instance_from(user_hash: result[0])
  end

  def self.find(id:)
    return nil unless id
    result = db_access.exec("SELECT * FROM users WHERE id = '#{id}';")
    new_instance_from(user_hash: result[0])
  end  

  def self.authenticate(email:, password:)
    result = db_access.exec("SELECT * FROM users WHERE email = '#{email}';")
    return nil unless result.any?
    new_instance_from(user_hash: result[0])
  end

  private_class_method

  def self.db_access
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')     
    end
  end

  def self.new_instance_from(user_hash:)
    new(
      id: user_hash['id'],
      name: user_hash['name'],
      email: user_hash['email'],
      password: user_hash['password']
    )
  end

end
