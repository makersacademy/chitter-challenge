require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  #property :time, Time
  property :post_time, Text
  property :user_id, Serial
  property :username, String
  property :name, String

  def time=(time)
    self.post_time = "#{time.hour}:#{time.min} #{time.day}/#{time.month}/#{time.year}"
  end

end