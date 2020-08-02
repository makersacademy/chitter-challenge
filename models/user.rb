require 'bcrypt'
require_relative './database_start_script'


class User

  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @name = name
    @email = email
    @id = id
  end

  def self.create(name:,email:,password:)
    encrypted_password = BCrypt::Password.create(password)
    record = DatabaseConnection.query("INSERT INTO USERS (name, email_address, password) VALUES('#{name}','#{email}','#{encrypted_password}') RETURNING id, name, email_address")[0]
    User.new(id: record['id'], name: record['name'], email:record['email_address'])
  end

  def self.find(id:)
    return nil unless id

    record = DatabaseConnection.query("SELECT * FROM USERS WHERE ID = #{id}")[0]
    User.new(id: record['id'], name: record['name'], email:record['email_address'])
  end

end
