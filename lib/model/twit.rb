# understands nothing.

class Twit
  include DataMapper::Resource
  property :id, 	  Serial
  property :content, String, length: 140
  property :date, Date

  belongs_to :user
end
