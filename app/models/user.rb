require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'peep'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String

  has n, :peeps

  def self.authenticate(username, password)
    self.first(username: username, password: password)
  end
end
