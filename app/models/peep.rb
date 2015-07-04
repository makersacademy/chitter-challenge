require 'data_mapper'
require 'dm-postgres-adapter'


class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       Text
  property :user,       String

end