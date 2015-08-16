module Chitter
  module Models
    class Peep
      include DataMapper::Resource

      property :id, Serial
      property :content, String
      property :time, String
      has n, :users, through: Resource
    end
  end
end