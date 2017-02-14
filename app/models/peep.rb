class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  belongs_to :user

  def self.all_in_reverse_order
    self.all(:order => [ :id.desc ])
  end

end
