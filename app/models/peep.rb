# Display Peeps
class Peep
  include DataMapper::Resource

  # has n, :users, through: Resource

  property :id, Serial
  property :name, String
  property :user_name, String
  property :peep, Text
  property :time, Time

end
