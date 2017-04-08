class Peep

  include DataMapper::Resource

  # has 1, :user, through: Resource, key: true, default: 1

  property :id, Serial
  property :text, String

end
