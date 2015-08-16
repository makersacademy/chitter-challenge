module Chitter

  module Models

    class Peep

      include DataMapper::Resource

      property :id, Serial
      property :peep, String, required: true
      property :time, String
      belongs_to :user

    end

  end

end
