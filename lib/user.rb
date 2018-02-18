require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :email, :password, :name, :handle

  def initialize(id, email, password, name, handle)
    @id = id
    @email = email
    @password = password
    @name = name
    @handle = handle
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password'], user['name'],
      user['handle']) }
  end

  def self.create(user)
    raise "There is already an account with that email address" if email_taken?(user[:email])
    raise "That handle has been taken, please try again" if handle_taken?(user[:handle])
    password = BCrypt::Password.create(user[:password])
    result = DatabaseConnection.query("INSERT INTO users (email, name, handle, password)
                              VALUES ('#{user[:email]}',
                                      '#{user[:name]}',
                                      '#{user[:handle]}',
                                      '#{password}')
                              RETURNING id, email, name, handle, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['handle'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['handle'])
  end

  def self.sign_in(params)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['handle'])
  end

  def self.email_taken?(email)
    emails = User.all.map { |user| user.email }
    emails.include? email
  end

  def self.handle_taken?(handle)
    handles = User.all.map { |user| user.handle }
    handles.include? handle
  end

end
