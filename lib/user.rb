require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String,     :required => true
  property :username, String,     :required => true, :unique => true
  property :email,    String,     :required => true, :unique => true
  property :password, BCryptHash, :required => true

  def self.authenticate(username:, password:)
    allUsersWithUsername = all(username: username)
    return nil if allUsersWithUsername.length != 1
    user = allUsersWithUsername.first
    return nil unless user.password == password
    user
  end
end
