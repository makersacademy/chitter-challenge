class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
#   property :time, Time
#
#   belongs_to :user
end
