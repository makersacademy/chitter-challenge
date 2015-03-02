class Message

  include DataMapper::Resource

  property :id,       Serial
  property :content,  Text

  # belongs_to :user 
end