require_relative '../data_mapper_setup'
require 'bcrypt'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :peeptext,   Text, required: true, length: 140
  property :created_at, DateTime

  belongs_to :user

end
