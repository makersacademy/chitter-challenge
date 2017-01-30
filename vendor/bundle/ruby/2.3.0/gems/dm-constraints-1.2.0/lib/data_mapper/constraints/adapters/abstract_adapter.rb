require "data_mapper/constraints/adapters/extension"

module DataMapper
  module Constraints
    module Adapters
      module AbstractAdapter

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

      end # module AbstractAdapter
    end # module Adapters
  end # module Constraints

  Adapters::AbstractAdapter.class_eval do
    include Constraints::Adapters::AbstractAdapter
  end

  Adapters::AbstractAdapter.descendants.each do |adapter_class|
    const_name = DataMapper::Inflector.demodulize(adapter_class.name)
    Adapters.include_constraint_api(const_name)
  end

end # module DataMapper
