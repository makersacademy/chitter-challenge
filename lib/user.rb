require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password, String

  has n, :peeps

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

