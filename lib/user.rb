require 'data_mapper'
require 'dm-validations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, Text
  property :username, Text, :unique => true
  property :email, Text, :unique => true
  property :password, BCryptHash

  def self.authenticate(username, password)
    user = first(username: username)
    return nil unless user

    if user.password == password
      user
    else
      nil
    end
  end

end
