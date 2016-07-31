class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true
  property :created_at, Time, default: lambda { |r, p| Time.now }

  belongs_to :user
end
