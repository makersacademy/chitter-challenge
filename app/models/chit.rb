require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Chit

	include DataMapper::Resource

	property :id, Serial
	property :text, String, length: 255, required: true
	property :created_at, DateTime

	belongs_to :user

end
