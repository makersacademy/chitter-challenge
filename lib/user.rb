# frozen_string_literal: true
require 'bcrypt'
require_relative 'database_connection'

class User
  attr_reader :id, :email

  def initialize(email)
    @id = id
    @email = email
  end

  # not currently working with my database_connection helper if I swap it over

  def self.create(email, password, persons_name, username)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    encrypted_password = BCrypt::Password.create(password)
    connection.exec("INSERT INTO users (email, password, persons_name, username) VALUES('#{email}', '#{encrypted_password}', '#{persons_name}', '#{username}') RETURNING id, email;")
    User.new(email)
  end
end
