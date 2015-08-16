require 'data_mapper'

class Cheets

	include DataMapper::Resource

	property :id,      Serial
	property :message, String
	property :time,    DateTime

end