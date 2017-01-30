module DataMapper
  module Aggregates
    module Collection
      include Functions

      private

      def property_by_name(property_name)
        properties[property_name]
      end
    end
  end
end
