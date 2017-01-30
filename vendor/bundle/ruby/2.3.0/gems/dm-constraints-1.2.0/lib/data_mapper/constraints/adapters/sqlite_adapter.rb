module DataMapper
  module Constraints
    module Adapters

      module SqliteAdapter

        # @api private
        def constraint_exists?(*)
          false
        end

        # @api private
        def create_relationship_constraint(*)
          false
        end

        # @api private
        def destroy_relationship_constraint(*)
          false
        end

      end

    end
  end
end
