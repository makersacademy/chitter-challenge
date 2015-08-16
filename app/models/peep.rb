module Chitter

  module Models

    class Peep

      include DataMapper::Resource

      property :id, Serial
      property :peep, String
      property :time, String
      belongs_to :user

    end

  end

end
