class Peep
    include DataMapper::Resource
    
    property :id,           Serial
    property :body,         Text, required: true
    property :created_at,    DateTime
    
    belongs_to :user
    
    def name
        user.name
    end
    
    def user_name
        user.user_name
    end
end
