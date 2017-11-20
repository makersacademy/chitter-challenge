class Tag
  include DataMapper::Resource

  belongs_to :user
  has n, :peeps, through: Resource

  property :id, Serial
  property :tag_name, String, :required => true
end
