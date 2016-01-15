class Reply
  include DataMapper::Resource

  property :id, Serial
  property :reply_text, Text
  property :reply_time, String
  property :reply_author, String
end
