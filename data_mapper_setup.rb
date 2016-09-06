require 'data_mapper'
require 'dm-postgres-adapter'
# later you'll need to require the files that are using DM to connect to your DB

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
