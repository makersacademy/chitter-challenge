require 'rubygems'
require 'data_mapper'

class Peep

  include DataMapper::Resource
  
  property :id,      Serial
  property :content, String
  property :date,    String 
  
  belongs_to :user

end
