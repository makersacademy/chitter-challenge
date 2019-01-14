require 'data_mapper'
require 'pry'
class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true
  property :mail, Text, :unique => true
  property :password, BCryptHash

  def self.auth(username, password)
    user = first(username: username)
    return nil unless user
    if user.password == password
      user
    else
      nil
    end
  end
end
