class Reply
  include DataMapper::Resource

  property :id,         Serial
  property :content,    String
  property :owner,      String
  property :created,    DateTime

  belongs_to :peep


end
