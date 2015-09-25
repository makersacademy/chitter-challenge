require 'data_mapper'

class Peep
    
    include DataMapper::Resource

    property :id, Serial
    property :content, Text
    property :created_at, DateTime
    property :user_id, String
    belongs_to :user

end