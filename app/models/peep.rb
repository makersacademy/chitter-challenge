class Peep
  include DataMapper::Resource

  # belongs_to :user, :through => Resource

  property :id, Serial
  property :words, String
  property :email, String

end
