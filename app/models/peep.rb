require './app/data_mapper_setup'
require 'dm-validations'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :title, String
  property :created_at, DateTime
  property :message, Text
end
