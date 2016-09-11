require_relative '../data_mapper_setup'
require 'dm-timestamps'

class Peeps
  include DataMapper::Resource

  property :id,         Serial
  property :peep,       Text,     :required => true
  property :created_at, DateTime

  belongs_to :users

end
