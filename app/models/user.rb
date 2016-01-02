require 'data_mapper'
require 'dm-postgres-adapter'


class User

	include DataMapper::Resource
	has n, :peeps, through: Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
	property :name, String, required: true
	property :user_name, String, unique: true, required: true
	property :email, String, unique: true, format: :email_address, required: true
	property :password, BCryptHash

	validates_confirmation_of :password

end

