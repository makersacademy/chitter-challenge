class Reply

  include DataMapper::Resource

  belongs_to :user
  belongs_to :peep

  property :id, Serial
  property :text, String
  property :time, Time

end