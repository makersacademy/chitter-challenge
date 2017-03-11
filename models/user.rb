require 'data_mapper'
require 'dm-core'
require 'dm-validations'
require 'dm-postgres-adapter'
class User
include DataMapper::Resource

property :id, Serial
property :first_name, String, :required => true
property :last_name, String, :required => true
property :user_name, String, :unique => true, :required => true
property :email, String, :unique => true, :required => true
property :password, String, :required => true
end 

DataMapper.setup(:default, "postgres://localhost/chitter_users_test")
DataMapper.finalize
DataMapper.auto_upgrade!
