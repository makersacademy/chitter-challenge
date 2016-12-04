require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password, String
end

# DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# DataMapper.finalize
# DataMapper.auto_upgrade!
