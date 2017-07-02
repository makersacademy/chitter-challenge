class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def self.get_ordered_peeps
    self.all(:order => [:created_at.desc])
  end
end
