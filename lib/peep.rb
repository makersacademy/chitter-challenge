require 'data_mapper'
require 'dm-validations'

class Peep
	include DataMapper::Resource

	property :id, Serial
	property :content, String, required: true, message: "Please enter something!"
	property :created_on, DateTime, default: lambda { |r,p| DateTime.now }

	belongs_to :user

end