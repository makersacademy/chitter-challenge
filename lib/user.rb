require 'bcrypt'
require_relative 'databaseconnection'
require 'uri'

class User 
  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    return false unless User.valid_email?(email: email)
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query("INSERT INTO users (user_name, username, email, user_password) VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}') RETURNING id, user_name, username, email;")
    User.new(id: (user[0]['id']), name: (user[0]['user_name']), username: (user[0]['username']), email: (user[0]['email']))
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: (result[0]['id']), name: (result[0]['user_name']), username: (result[0]['username']), email: (result[0]['email']))
  end

  private 

  def self.valid_email?(email:)
    email =~ URI::MailTo::EMAIL_REGEXP
  end


end


# if params['email'] =~ URI::MailTo::EMAIL_REGEXP
#   @user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
#   session[:user_id] = @user.id
#   session[:username] = @user.username
#   redirect "users/#{@user.id}"
# else flash[:notice] = "Please give us a real email FFS!"
# end
# redirect '/users/new'