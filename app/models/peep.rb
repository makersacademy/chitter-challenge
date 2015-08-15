require 'data_mapper'
require 'dm-validations'

class Peep

	include DataMapper::Resource

	property :id, Serial
	property :content, String # :required => true, :min => 1 ,:length => 1..140

	# belongs_to :user

end