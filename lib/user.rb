require 'data_mapper'
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String
  property :username, String
  property :name, String

  def self.make(email: email, password: password, username: username, name: name)
    return false unless self.new_email?(email)
    return false unless self.new_username?(username)
    self.create(email: email, password: password, username: username, name: name)
  end

  def self.sign_in(username: username, password: password)
    return false unless self.username_exist?(username)
    return false unless self.password_correct?(username, password)
    @current_user = self.first(username: username)
  end

  def self.sign_out
    @current_user = nil
  end

  def self.current_user
    @current_user
  end

  private

  def self.new_email?(email)
    self.count(email: email) == 0
  end

  def self.new_username?(username)
    self.count(username: username) == 0
  end

  def self.username_exist?(username)
    self.count(username: username) != 0
  end

  def self.password_correct?(username, password)
    user = self.first(username: username)
    user.password == password
  end

end
