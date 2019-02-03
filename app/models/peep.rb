require 'data_mapper'
require_relative 'user'

class Peep

  include DataMapper::Resource

  DataMapper.setup :default, "postgres://localhost/shitter"


  property :id,         Serial
  property :body,       String, required: true, length: 0..130
  property :created_at, DateTime

  def date_and_time
    x = self.created_at
    "#{x.day}/#{x.month}/#{x.year}   #{x.hour}:#{x.minute}.#{x.second}"
  end

  belongs_to :user, required: false

end
