require_relative '../data_mapper_setup'
require 'dm-timestamps'

class Message
	include DataMapper::Resource

	property :id, Serial
	property :created_at, DateTime, format: :timestamp_format
	property :peep, Text
	belongs_to :user
end