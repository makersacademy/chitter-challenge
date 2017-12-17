class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, Time

  belongs_to :user

  def self.ordering_reverse_chronological
    all.sort_by { |peep| peep.created_at }.reverse
  end

  

end
