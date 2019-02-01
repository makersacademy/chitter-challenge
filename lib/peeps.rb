require 'data_mapper'

class Peeps
  include DataMapper::Resource
  property :id, Serial
  property :message, String
  property :created_at, DateTime


end

DataMapper.finalize
