require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

include DataMapper::Resource

property :id, Serial
property :name, String
property :username, String
property :message, String
property :time, String

end
