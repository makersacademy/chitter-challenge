class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :text, String
  property :context, String
  property :time, String
  property :date, String
  belongs_to :user
end
