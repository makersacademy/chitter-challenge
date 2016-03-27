class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text
  property :time,       Time
  property :username,   String
  property :name,       String

  belongs_to :user

end
