class Peep
  include DataMapper::Resource

  belongs_to :user
  has n, :responses

  property :id, Serial
  property :content, String, required: true, :length => 5..150,
    :message => "Please keep peeps between 5 and 150 characters long"
  property :created_at, DateTime

  validates_presence_of :content

end
