class Peep

  include DataMapper::Resource

  property :id, Serial
  property :post, String

  belongs_to :user

end
