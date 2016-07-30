class Peep
  include DataMapper::Resource

  has n, :messages, through: Resource

  property :id, Serial
  property :title, String
  property :message, String
end
