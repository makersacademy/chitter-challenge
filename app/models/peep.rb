class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String, required: true, length: 140
  property :created_at, DateTime
  property :created_on, Date

  belongs_to :user
end
