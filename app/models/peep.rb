class Peep
  include DataMapper::Resource

  property :id,                         Serial
  property :text,                       Text, required: true
  property :created_at, DateTime

  belongs_to :user, :required => false
end
