require_relative '../data_mapper_setup'

class Tag
  include DataMapper::Resource
    property :id, Serial
    property :name, String
    has n, :links, through: Resource
end
