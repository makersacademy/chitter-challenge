class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  belongs_to :user
end
