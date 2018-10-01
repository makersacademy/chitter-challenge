require 'data_mapper'
require_relative 'database_connect'
require 'pg'

class User

  include DataMapper::Resource

property :id,           Serial
property :name,         String
property :username,     String
property :email,        String
property :password,     String


end

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize
DataMapper.auto_upgrade!
