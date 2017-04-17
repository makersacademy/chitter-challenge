require 'data_mapper'
require 'dm-postgres-adapter'

require_relative '../app/models/tag'
require_relative '../app/models/user'
require_relative '../app/models/peep'
require_relative '../app/models/reply'
# DataMapper::Logger.new(STDOUT, :debug)
p ENV['RACK_ENV']
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
