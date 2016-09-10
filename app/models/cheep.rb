require_relative '../data_mapper_setup'

class Cheep
  include DataMapper::Resource

  property :id,     Serial
  property :cheep,  String, length: 255, required: true


  belongs_to :user

end
