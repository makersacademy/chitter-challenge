require 'data_mapper'

class Peep

  include DataMatter::Resource

  property :id, Serial
  property :content, String
  property :created_at, DateTime

# attr_reader :content
#
# def initialize(content)
#   @content = content
# end

end
