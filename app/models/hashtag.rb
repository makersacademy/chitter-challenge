
class Hashtag
  include DataMapper::Resource

  property :id, Serial
  property :tag, String
end