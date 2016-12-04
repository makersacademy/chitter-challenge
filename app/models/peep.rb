require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

	include DataMapper::Resource

	has n, :user, :through => Resource

	property :id, Serial
	property :firstname, String
	property :surname, String
	property :username, String
	property :text, String

end