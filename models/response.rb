class Response
  include DataMapper::Resource

  belongs_to :peep
  belongs_to :user

  property :id, Serial
  property :content, String, required: true, :length => 5..150,
    :message => "Please keep responses between 5 and 150 characters long"
  property :created_at, DateTime

  validates_presence_of :content
end
