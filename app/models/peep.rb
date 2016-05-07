require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
	include DataMapper::Resource

	property :id, Serial
	property :content, Text
	property :time, DateTime

	def time_format
		# self.time.strftime("%c")
		self.time.strftime("Posted on %m/%d/%Y at %I:%M%p")
	end

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!