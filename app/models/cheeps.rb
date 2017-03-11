require 'data_mapper'
require 'dm-postgres-adapter'

class Cheeps
include DataMapper::Resource
property :id, Serial #or timestamp
property :user, String
property :message, String
end

# DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}" )
DataMapper.setup(:default, 'postgres://localhost/cheep_test')
DataMapper.finalize
DataMapper.auto_upgrade!

# cheep = Cheep.create(
# :id => 1,
# :user => "Amazon",
# :message => "http://www.amazon.com"
# )
