require 'data_mapper'
require 'dotenv/load'

user = ENV['PSQL_USER']
password = ENV['PSQL_PASSWORD']
development_db = ENV['DEVELOPMENT_DATABASE']
test_db = ENV['TEST_DATABASE']
host = ENV['HOST']

DataMapper.setup(:default,
                 "postgres://#{user}:#{password}@#{host}/#{test_db}")
DataMapper.finalize
DataMapper.auto_upgrade!
