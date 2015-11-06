require_relative '../data_mapper_setup'

class Link
  include DataMapper::Resource

    property :id, Serial
    property :message, String
    # property :url, String
    has n, :tags, through: Resource
end
