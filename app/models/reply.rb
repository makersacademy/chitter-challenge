class Reply
  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :time, String
  property :replier, String

  belongs_to :peep

end
