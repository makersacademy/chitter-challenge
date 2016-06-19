require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

require_relative '../app/models/peep'
require_relative '../app/models/reply'
require_relative '../app/models/user'

DataMapper.setup(
  :default, ENV['DATABASE_URL'] ||
  "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
