class Comment
  include DataMapper::Resource

  property :id,     Serial
  property :peep_reply,  String

  belongs_to :peep
end
