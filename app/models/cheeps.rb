require 'data_mapper'
require 'dm-postgres-adapter'

class Cheeps
include DataMapper::Resource
property :id, Serial 
property :username, String
property :message, String
property :timestamp, Time
end

# DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}" )
DataMapper.setup(:default, 'postgres://localhost/chitter_test')
DataMapper.finalize
DataMapper.auto_upgrade!

# cheeps = Cheeps.create(
# :id => 1,
# :username => "Test",
# :message => "Testing cheeps."
# :timestamp =>
# :user =>
# );
