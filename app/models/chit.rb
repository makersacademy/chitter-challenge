require 'data_mapper'
require 'dm-postgres-adapter'


class Chit

	include DataMapper::Resource

	property :id, Serial
	property :text, String
	property :time, Time

	belongs_to :user

end
