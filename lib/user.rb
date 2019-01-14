require 'data_mapper'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :password, BCryptHash
  property :actualname, String
  property :username, String, :unique => true

  has n, :peep

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
