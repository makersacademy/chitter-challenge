require 'data_mapper'

class Cheet

	include DataMapper::Resource

	property :id,      Serial
	property :message, String
	property :time,    DateTime

	belongs_to :user
end