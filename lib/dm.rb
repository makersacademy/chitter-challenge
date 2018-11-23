require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'

DataMapper.setup(:default, "postgres://localhost/chitter")


class User
	include DataMapper::Resource

	property :id, 						Serial
	property :username, 			String
	property :email, 					String
	property :first_name, 		String
	property :last_name,			String
	property :password, 			String
	property :Date_of_birth, 	Integer
end

class Peeps
	include DataMapper::Resource
end

DataMapper.auto_upgrade!