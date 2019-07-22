require 'rubygems'
require "data_mapper"

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

class Users

  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :username,   String
  property :email,      String
  property :password,   String
end

DataMapper.finalize
DataMapper.auto_upgrade!

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.auto_migrate!
end