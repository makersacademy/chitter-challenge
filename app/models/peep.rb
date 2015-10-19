module ChitterApp
  module Models
    class Peep
      include DataMapper::Resource
      property :id, Serial
      property :content, Text
      property :creation_time, DateTime
      belongs_to :user
      has n, :replies#, through: Resource
    end
  end
end
