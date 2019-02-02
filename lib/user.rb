require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password, BCryptHash
  property :name, String

  has n, :peeps

  def self.authenticate(email:, password:)
    return nil unless User.first(:email => email)
    user = User.first(:email => email)
    user.password == password ? user : nil
  end

  def self.add(username:, email:, password:, name:)
    create(username: username, email: email, password: password, name: name)
  end
end
