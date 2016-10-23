require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require_relative '../../data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :peep,     String, :length => 50
  property :user_id,  Integer

  belongs_to :user

end
