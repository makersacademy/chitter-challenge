require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
	include DataMapper::Resource

	property :id, Serial
	property :title, String
	property :body, String
	property :created_at, Time

end

