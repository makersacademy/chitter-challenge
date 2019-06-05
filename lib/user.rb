require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './peep'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :email,          String, :required => true, :unique => true, :format => :email_address
  property :password,       String, :required => true
  property :name,           String, :required => true
  property :username,       String, :required => true, :unique => true

  has n, :peeps

  def self.authenticate(email:, password:)
    user = User.first(email: email)
    user != nil && user.password == password ? user : nil
  end
end
