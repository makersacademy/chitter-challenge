class Tag
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id,      Serial
  belongs_to :user, :required => false
end
