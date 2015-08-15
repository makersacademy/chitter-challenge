module Chitter
  module Models
    class Peep
      include DataMapper::Resource

      property :id, Serial
      property :content, String
    end
  end
end