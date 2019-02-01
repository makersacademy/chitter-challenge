require 'data_mapper'

class Peeps
  include DataMapper::Resource
  property :id, Serial
  property :message, String


end

DataMapper.finalize
