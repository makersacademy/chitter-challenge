class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String, required: true, :length => 140
  property :media, String, :length => 250
  property :date, DateTime, required: true

  has n, :tags, :through => Resource, constraint: :destroy
  has n, :replys, :through => Resource, constraint: :destroy

  belongs_to :user
  validates_format_of :media, :with => /https?:\/\/[\S]+/
end
