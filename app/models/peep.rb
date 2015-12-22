class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String

  belongs_to :user
end
