
require 'data_mapper'
require 'dm-postgres-adapter'


class Chit

  include DataMapper::Resource

  property :id,              Serial # Serial means that it will be auto-incremented for every record
  property :user,            String
  property :chitter_post,    String

end

