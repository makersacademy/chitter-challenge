require 'data_mapper'

module TheApp

  module Models

    class Peep
      include DataMapper::Resource

      property :id, Serial
      property :content, Text
      property :time_created, DateTime

      belongs_to :user

    end

  end

end



