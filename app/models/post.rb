require_relative '../data_mapper_setup'

# :nodoc:
class Post
  include DataMapper::Resource

  property :id,     Serial
  property :tip,    String
end
