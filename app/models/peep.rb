class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String, required: true
  property :time, DateTime, required: true

  belongs_to :user
end
