class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def self.show_ordered_peeps
    all(:order => [:created_at.desc])
  end
end
