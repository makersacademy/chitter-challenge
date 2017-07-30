require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class User
  include DataMapper::Resource

  has n, :peeps

  property :id,   Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true
  property :password, Text, required: true
end
