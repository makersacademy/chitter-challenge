require_relative '../../data_mapper_setup'
class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
end
