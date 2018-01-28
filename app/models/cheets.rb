class Cheets

  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id, Serial
  property :user, String
  property :message, String

end
#
