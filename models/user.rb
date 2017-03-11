require 'data_mapper'
require 'dm-postgres-adapter'
class User
include DataMapper::Resource

property :id, Serial
property :first_name, String
property :last_name, String
property :user_name, String #:required => true, :unique => true
property :email, String
property :password, String
end

DataMapper.setup(:default, "postgres://localhost/chitter_users_test")
DataMapper.finalize
DataMapper.auto_upgrade!
