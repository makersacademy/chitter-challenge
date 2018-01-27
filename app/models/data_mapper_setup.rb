# require 'data_mapper'
# require 'dm-postgres-adapter'
#
# # require_relative './models/'
# # require_relative './models/'
# # require_relative './models/'
#
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.finalize

require 'data_mapper'
require 'dm-postgres-adapter'

# require_relative './user'
# require_relative './peep'



DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
