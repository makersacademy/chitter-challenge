class Reply
  include DataMapper::Resource

  belongs_to :post
  belongs_to :user

  property :id,         Serial
  property :comment,    Text, :length => 140
end
