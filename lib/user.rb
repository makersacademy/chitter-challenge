require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password, BCryptHash

  has n, :messages

  def self.authenticate(email, password)
    user = first(email: email)
    return nil unless user
    user.password == password ? user : nil
  end

end