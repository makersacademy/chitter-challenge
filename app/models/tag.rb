class Tag
  include DataMapper::Resource
  property :id, Serial

  belongs_to :peep, required: false

end
