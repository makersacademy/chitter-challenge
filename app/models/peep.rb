require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  attr_reader :post

  include DataMapper::Resource

  has 1, :user, through: Resource

	property :id, Serial
	property :post, String, required: true, length: 145
  property :author, String
	property :time, DateTime
end
