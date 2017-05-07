require 'date'
require_relative 'printer'

class Message
  include DataMapper::Resource
  include Printer

  property :id, 	Serial
  property :content, 	String, length: 140, required: true
  property :timestamp,	DateTime

  belongs_to :user, required: true
end
