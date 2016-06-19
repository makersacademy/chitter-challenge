class Hashtag
  include DataMapper::Resource

  property(:id, Serial)
  property(:name, String, required: true)

  has(n, :peeps, through: Resource)
end
