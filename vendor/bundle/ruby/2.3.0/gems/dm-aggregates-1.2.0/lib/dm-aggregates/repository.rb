module DataMapper
  module Aggregates
    module Repository
      def aggregate(query)
        unless query.valid?
          []
        else
          adapter.aggregate(query)
        end
      end
    end
  end
end
