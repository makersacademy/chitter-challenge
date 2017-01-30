require 'data_mapper/constraints/adapters/do_adapter'

module DataMapper
  module Constraints
    module Adapters

      module PostgresAdapter
        include DataObjectsAdapter
      end

    end
  end
end
