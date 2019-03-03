require 'pg'
require 'database_connection'
require_relative './peep.rb'
require 'data_mapper'
require 'bcrypt'





  class User
      attr_reader :id, :email, :firstname, :lastname, :username, :password
    include DataMapper::Resource
    include BCrypt

    property :id       , Serial
    property :firstname, String
    property :lastname , String
    property :username , String
    property :email    , String, format: :email_address
    property :password , BCryptHash

    has n, :peeps

  def initialize(id:, email:, firstname:, lastname:, username:, password:)
    @id = id
    @email = email
    @firstname = firstname
    @lastname = lastname
    @username = username
    @password = password
  end

  # def self.all
  #   result = DatabaseConnection.query("SELECT * FROM users1")
  #   result.map do |user|
  #   User.new(id: user['id'], email: user['id'], firstname: user['firstname'], lastname: user['lastname'], username: user['username'], password: user['password'])
  #   end
  # end
  #
  # def self.update(id:, email:, firstname:, lastname:, username:, password:)
  #   result = DatabaseConnection.query("UPDATE users1 SET username = '#{username}', email = '#{email}', firstname = '#{firstname}, lastname = '#{lastname}', password = '#{passwprd}'
  #       WHERE id = #{id} RETURNING id, firstname, lastname, username, email, password;")
  #   User.new(id: user['id'], email: user['id'], firstname: user['firstname'], lastname: user['lastname'], username: user['username'], password: user['password'])
  # end
  #
  # def self.find(id:)
  #   result = DatabaseConnection.query("SELECT * FROM users1 WHERE id = '#{id}' RETURNING id, firstname, lastname, username, email, password")
  #   User.new(id: user['id'], email: user['id'], firstname: user['firstname'], lastname: user['lastname'], username: user['username'], password: user['password'])
  # end
  #
  # def self.create(id:,email:, firstname:, lastname:, username:, password:)
  #   result = DatabaseConnection.query("INSERT INTO users1 (peep, time) VALUES('#{firstname}', '#{lastname}', #{username}', #{email}', #{password}') RETURNING id, firstname, lastname, username, email, password;")
  #   User.new(id: user['id'], email: user['id'], firstname: user['firstname'], lastname: user['lastname'], username: user['username'], password: user['password'])
  # end
  #
  # def self.delete(id:)
  #   DatabaseConnection.query("DELETE FROM users1 WHERE id = '#{id}';")
  # end
end
