class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, :required => true, :length => 140
  property :created_at, DateTime, :default => DateTime.now

  belongs_to :user, :required => true
end
