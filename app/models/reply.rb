class Reply

  include DataMapper::Resource


  property :id, Serial
  property :content, Text

  belongs_to :peep

end
