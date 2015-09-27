require 'bcrypt'

module ChitterApp
  module Models
    class Peep
      include DataMapper::Resource
      property :id, Serial
      property :content, Text
      property :creation_time, DateTime
      belongs_to :user
      # has n, :user, through: Resource
    end
  end
end
