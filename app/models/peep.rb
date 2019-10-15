class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, :length => 140
  property :created_at, DateTime

  belongs_to :user

  def self.reverse_order
    all(:order => [:created_at.desc])
  end
end
