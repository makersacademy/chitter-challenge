module ChitterApp
  module Models
    
    class Peep

      include DataMapper::Resource

      property :id,     Serial
      property :post,   String
      property :user,   String
      property :time,   DateTime

      has n, :tags, through: Resource

    end
  end
end
