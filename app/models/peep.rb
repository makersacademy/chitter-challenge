class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String, required: true, length: 140

  belongs_to :user
end
