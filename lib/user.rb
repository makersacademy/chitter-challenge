require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String,     :required => true
  property :username, String,     :required => true, :unique => true
  property :email,    String,     :required => true, :unique => true
  property :password, BCryptHash, :required => true

  def self.authenticate(username:, password:)
    user = all(username: username)
    return nil if user.length != 1
    return nil unless user.first.password == password
    user.first
  end
end
