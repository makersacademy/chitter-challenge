class Tweet

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :message, String

end
