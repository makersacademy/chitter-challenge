class Peep
  
  include DataMapper::Resource

  property :id,           Serial
  property :content,      Text, :length => 255
  property :created_at,   DateTime

  belongs_to :user

end  