class Peep

  include DataMapper::Resource

  property :peep_id, Serial
  property :content, String
  belongs_to :user
end
