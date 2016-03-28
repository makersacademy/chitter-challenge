class Peep
  include DataMapper::Resource
  property :id, Serial
  property :message, String, length: 140, required: true
  belongs_to :user
end
