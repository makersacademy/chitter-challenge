require 'pg'
require'bcrypt'

class User
  include BCrypt

  attr_reader :name, :username, :email

  def initialize(name:, username:, email:, password:)
    @name = name
    @username = username
    @email = email
    @password_hash = password
  end

  def self.create(name:, username:, email:, password:)
    password_hash = Password.create(password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4) RETURNING name, username, email, password", [name, username, email, password_hash])

    result.map do |user|
      User.new(name: user['name'], username: user['username'], email: user['email'], password: user['password'])
    end.first
  end

  def password
    password ||= Password.new(@password_hash)
  end
    

end 