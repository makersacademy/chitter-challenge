require 'data_mapper'

class Users
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  property :username, String, :required => true
  property :email, String, :required => true
  property :password, String, :required => true
end

DataMapper.finalize
