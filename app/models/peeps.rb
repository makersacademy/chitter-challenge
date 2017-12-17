require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
include DataMapper::Resource

property :id,   Serial
property :message, String
property :created_at, DateTime


end
