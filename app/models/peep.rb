require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

	include DataMapper::Resource

	has n, :users, through: Resource

	property :id, Serial
	property :user, String
	property :text, String
	property :created_at, DateTime

end