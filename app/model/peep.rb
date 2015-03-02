class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :creation_date, DateTime
  belongs_to :chatter_user




end
