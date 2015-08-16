class Peep
    
    include DataMapper::Resource

    property :id, Serial
    property :content, Text
    property :user_id, String
    
end