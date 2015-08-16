module ChitterModule

  module Models

    class Peep

      include DataMapper::Resource

      property :id, Serial
      property :body, String
      property :time, DateTime

      belongs_to :user

    end

  end

end