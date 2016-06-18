require 'data_mapper'
require 'dm-postgres-adapter'


class Chit

	include DataMapper::Resource

	property :id, Serial
	property :text, String
	property :time, Time

end

DataMapper.setup(:default, "postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
