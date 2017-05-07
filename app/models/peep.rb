class Peep
  include DataMapper::Resource
  property :id, Serial
  property :post, String
  property :time, String

  belongs_to :user, :required => true
end
