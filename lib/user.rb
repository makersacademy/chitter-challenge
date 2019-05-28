require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './peep'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :email,          String, :required => true, :unique => true
  property :password,       String, :required => true
  property :name,           String, :required => true
  property :username,       String, :required => true, :unique => true

  has n, :peeps
end
