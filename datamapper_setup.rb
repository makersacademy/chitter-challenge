require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/posts'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||"postgres://localhost/chitter_users_test")
DataMapper.finalize
DataMapper.auto_upgrade!
