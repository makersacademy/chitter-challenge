require 'data_mapper'
require 'dm-postgres-adapter'


class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text,  :required => true
  property :created_at, Time

end