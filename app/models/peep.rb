require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String, length: 140
  property :time, DateTime


  def time_string
    self.time.strftime("%H:%M:%S")
  end


  #has n, :users, :through => Resource
  belongs_to :user

end
