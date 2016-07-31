class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, :required => true, :length => 140

  belongs_to :user, :required => true
end
