class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true
  property :created_at, Time, default: lambda { |_r, _p| Time.now }

  belongs_to :user
end
