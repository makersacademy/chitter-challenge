class Repeep
  include DataMapper::Resource

  has n, :users, through: Resource
  has n, :peeps, through: Resource

  property :id,             Serial
  property :repeep_body,    Text, required: true
  property :time_stamp,     Time, required: true

end
