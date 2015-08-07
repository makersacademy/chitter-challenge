class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :body, String, length: 140
  property :time, DateTime

  belongs_to :user
end
