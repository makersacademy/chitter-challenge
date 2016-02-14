class Peep
 include DataMapper::Resource
 
 property :id, Serial
 property :name, String
 property :content, Text
 property :time_submitted, DateTime
  
end
