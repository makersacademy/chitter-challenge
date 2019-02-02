require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password, String
  property :name, String

  has n, :peeps

  def self.authenticate(email:, password:)
    return nil unless User.first(:email => email)
    user = User.first(:email => email)
    user.password == password ? user : nil
  end

end
