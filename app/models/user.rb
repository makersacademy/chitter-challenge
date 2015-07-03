require 'data_mapper'

class User

  include DataMapper::Resource

  property :id, Serial
end
