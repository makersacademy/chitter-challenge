require 'data_mapper'
require 'dotenv/load'

user = ENV['PSQL_USER']
password = ENV['PSQL_PASSWORD']
development_db = ENV['DEVELOPMENT_DATABASE']
test_db = ENV['TEST_DATABASE']
host = ENV['HOST']

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default,
                   "postgres://#{user}:#{password}@#{host}/#{test_db}")
elsif ENV['DEVELOPMENT'] == 'yes'
  DataMapper.setup(:default,
                   "postgres://#{user}:#{password}@#{host}/#{development_db}")
else
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
end

DataMapper.finalize
DataMapper.auto_upgrade!
