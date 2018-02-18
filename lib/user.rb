require_relative 'datamapper'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :peeper,     String
  property :username,   String
  property :email,      String
  property :password,   String
end

DataMapper.auto_migrate!
DataMapper.finalize
