class Comment
  include DataMapper::Resource

  property :id,     Serial
  property :peep_reply,  String

  validates_presence_of :peep_reply

  belongs_to :peep
end
