require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

	include DataMapper::Resource

	belongs_to :user

	property :id, Serial
	property :text, String
	property :created_at, DateTime

	def self.reverse_chronological_order
		self.all(order: :created_at.desc)
	end

end