class Cheets

  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id, Serial
  property :user, String
  property :message, String
  property :message_created, String, :default => Time.now.to_s

end
#
