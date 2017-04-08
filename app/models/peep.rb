
class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String

  # has 1, :user

  belongs_to :user

end
