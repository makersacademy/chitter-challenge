env = ENV['RACK_ENV'] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require_relative './lib/tweet'
require_relative './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!
DataMapper.auto_migrate!