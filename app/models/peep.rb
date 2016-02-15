require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

	include DataMapper::Resource

	property :id,	Serial
	property :name, String
	property :peep,	String
	property :time, String
end