class Message

  include DataMapper::Resource

  property :id, Serial
  property :memo, String

  # has n, :tags, through: Resource

end
