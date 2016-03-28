require 'data_mapper'
require 'dm-postgres-adapter'

class Comment

	include DataMapper::Resource

	attr_reader :user_id
	attr_reader :peep_id

	property :id, Serial
  property :post, Text
  property :time, String

end

