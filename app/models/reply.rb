class Reply
  include DataMapper::Resource

  property :id, Serial
  property :reply_text, Text
  property :reply_time, String

  belongs_to :chit
  belongs_to :user
end
