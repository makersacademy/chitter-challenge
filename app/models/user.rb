require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './peep.rb'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password, String

  has n, :peeps

# DataMapper.setup(:default, "postgres://localhost/chitter_development")
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# DataMapper.finalize
# DataMapper.auto_upgrade!

end
