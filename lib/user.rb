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

  private

  def self.new_email?(email)
    self.count(email: email) == 0
  end

  def self.new_username?(username)
    self.count(username: username) == 0
  end

end
