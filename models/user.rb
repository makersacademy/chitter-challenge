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

  def self.authenticate(email:, password:)
    record = DatabaseConnection.query("SELECT * FROM users WHERE email_address='#{email}';")
    return unless record.any?
    return User.new(id: record[0]['id'], name: record[0]['name'], email: record[0]['email_address']) if password == record[0]['password'] # because of my unencrypted users lol.
    return unless BCrypt::Password.new(record[0]['password']) == password
    User.new(id: record[0]['id'], name: record[0]['name'], email: record[0]['email_address'])
  end

end