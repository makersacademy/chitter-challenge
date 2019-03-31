require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String
  property :password, BCryptHash

  def self.authenticate(username:, password:)
    user = all(username: username)
    return nil if user.length != 1
    return nil unless user.first.password == password
    user.first
  end
end
