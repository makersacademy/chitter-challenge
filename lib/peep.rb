require 'data_mapper'
require 'dm-validations'

class Peep
	include DataMapper::Resource

	property :id, Serial
	property :content, String

	belongs_to :user

end