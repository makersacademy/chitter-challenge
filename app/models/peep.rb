class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String, length: 160
  property :time, DateTime

  belongs_to :user
end
