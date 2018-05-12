class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, :required => true
  property :user_name, Integer, :required => true
  property :created_at, Time, :required => true
end
