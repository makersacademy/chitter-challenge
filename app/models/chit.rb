
class Chit
  include DataMapper::Resource

  property :id, Serial
  property :title, Text, :lazy => false
  property :href, Text, :lazy => false

end
