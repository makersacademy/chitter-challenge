class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  #has 1, :user
  #belongs_to :user
  property :user, String
end
