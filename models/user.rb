require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id, Serial :accessor => :private
  property :username, String :accessor => :private
  property :email, String :accessor => :private
  property :password, String :accessor => :private
end
