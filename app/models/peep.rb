require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require_relative '../../data_mapper_setup'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :peep,       String, :length => 50
  property :created_at,  DateTime

  belongs_to :user

end
