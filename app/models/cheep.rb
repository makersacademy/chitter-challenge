class Cheep
  include DataMapper::Resource

  property :id,           Serial
  property :content,      Text, required: true, length: 140
  property :created_at,   DateTime

  belongs_to :user

end