require_relative '../data_mapper_setup'
require 'dm-validations'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource
  
  property :id,         Serial
  property :text,       String, required: true
  property :created_at, DateTime

  belongs_to :user
end
