require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
	include DataMapper::Resource

	belongs_to :user

	property :id, Serial
	property :content, Text
	property :time, DateTime

	def time_format
		self.time.strftime("Posted on %m/%d/%Y at %I:%M%p")
	end

end

