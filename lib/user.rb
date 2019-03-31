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
    user.first
  end
end
