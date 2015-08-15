require 'data_mapper'
require 'dm-validations'

class Peep

	include DataMapper::Resource

	property :id, Serial
	# property :user, String, :required => true
	property :content, String, :required => true #, :min => 1 ,:length => 1..140
	property :time, Time, :required => true
	

	# belongs_to :user


end