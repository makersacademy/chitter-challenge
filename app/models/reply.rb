class Reply
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :username, String
  property :name, String

  belongs_to :peep

end
