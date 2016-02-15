class Comment

  include DataMapper::Resource
	
	belongs_to :peep

  	property :id, Serial
    property :comment, String
    

end
