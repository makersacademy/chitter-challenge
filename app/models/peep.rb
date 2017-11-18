class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :content, Text, :required => true
  property :created_at, DateTime
end
