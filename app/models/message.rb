class Message
  include DataMapper::Resource

  belongs_to :user

  property :id,       Serial
  property :post,     String, required: true
  property :time,     String, required: true

end
