class Peep
  include DataMapper::Resource

  has n, :users, through: Resource
  has n, :repeeps, through: Resource

  property :id,          Serial
  property :body,        String, required: true
  property :time_stamp,  Time, required: true

end
