class Comment

  include DataMapper::Resource
	
	belongs_to :peep

  	property :id, Serial
    property :content, String
    property :created_at, DateTime
    property :time, String

end
