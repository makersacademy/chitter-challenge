class Peep
  include DataMapper::Resource

  property :id, Serial
  property :time, String
  property :content, Text
  property :name, String


  def short_time
    time[0..18]
  end
end
