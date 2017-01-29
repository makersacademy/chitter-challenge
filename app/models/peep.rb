class Peep
    include DataMapper::Resource
    
    def self.reverse_chronological
        all(:order => [ :created_at.desc ])
    end
    
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
    
    def creation_date
        self.created_at.strftime("%b %e %k:%M")
    end
end
