module DataMapper
  module Aggregates
    module Model
      include Functions

      private

      def property_by_name(property_name)
        properties(repository.name)[property_name]
      end
    end
  end
end
