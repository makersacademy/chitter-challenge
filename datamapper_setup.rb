# Set up DataMapper
require 'data_mapper'

user = ENV['CHITTER_USERNAME']
password = ENV['CHITTER_PASSWORD']

DataMapper.setup(:default, "postgres://#{user}:#{password}@localhost/chitter")
# DataMapper.setup(:default, 'postgres://user:password@hostname/database')
