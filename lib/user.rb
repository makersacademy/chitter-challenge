require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :username, String, :unique => true
  property :name, String
  ## problem with bcrypt
  property :password, String

  ## handles on message 
  has n, :messagings
  has n, :messages, :through => :messagings

  def self.authenticate(email, password)
    user = first(email: email)
    return nil unless user
    if user.password == password
      user
    else
      nil
    end
  end
end