require_relative '../data_mapper_setup'
require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  belongs_to :user
end
