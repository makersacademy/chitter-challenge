# frozen_string_literal: true
require 'data_mapper'
require 'dm-postgres-adapter'

class Message
	include DataMapper::Resource

	property :id, Serial
	property :text, Text
end

DataMapper.setup(:default, "postgres://localhost/critter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
p message = Message.create(text: 'Testing')
