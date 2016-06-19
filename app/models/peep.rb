require 'rubygems'
require 'data_mapper'

class Peep

  include DataMapper::Resource
  
  property :id,      Serial
  property :content, String
  property :date,    DateTime 
  
  belongs_to :user

  def pretty_date
    self.date.strftime('%A, %e %B at %k:%M') 
  end

end
