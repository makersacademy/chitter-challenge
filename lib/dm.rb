require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'
require 'database_cleaner'

if ENV['ENVIRONMENT'] == 'test'
	DataMapper.setup(:default, "postgres://localhost/chitter_test")
else
	DataMapper.setup(:default, "postgres://localhost/chitter")
end

class User
	include DataMapper::Resource
	User.raise_on_save_failure = true 

	property :id, 						Serial
	property :username, 			String
	property :email, 					String, format: :email_address
	property :first_name, 		String
	property :last_name,			String
	property :password, 			String, length: 8..16
	property :date_of_birth, 	String, length: 8

	has n, :peeps
end

class Peep
	include DataMapper::Resource
	Peep.raise_on_save_failure = true

	property :message_id,				Serial
	property :message_content, 	Text, required: true, lazy: :false, length: 1..180
	property :created_at,			 	DateTime
	property :user_id,					Integer
	property :author,						String

	belongs_to :user
end

DataMapper.finalize
DataMapper.auto_upgrade!