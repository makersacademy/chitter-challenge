module Chitter

  module Models

    class Peep

      include DataMapper::Resource

      property :id, Serial
      property :peep, String

    end

  end

end
