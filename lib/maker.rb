require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://david@localhost/chitter')

class Maker
  include DataMapper::Resource

  has n, :peeps

  property :id,           Serial, :key => true
  property :displayname,  String
  property :username,     String
end
