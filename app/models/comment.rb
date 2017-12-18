require './app/data_mapper_setup'

class Comment

  time = Time.now.strftime("%d/%m/%Y %H:%M")

  include DataMapper::Resource

  property :id,         Serial
  property :comment,    Text 
  property :created_at, String,  :default => time
  property :author,     String

end
