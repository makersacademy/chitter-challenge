require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true, :format => :email_address
  property :password, BCryptHash
  property :name, String
  property :username, String, :unique => true

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
