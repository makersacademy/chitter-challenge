require 'data_mapper'
require 'dm-postgres-adapter'


class Chit

	include DataMapper::Resource

	property :id, Serial
	property :text, String
	property :time, Time

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
