require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

property :id,  Serial
property :user, String
property :message,  String

end
