require 'data_mapper/constraints/relationship/one_to_many'

module DataMapper
  module Constraints
    module Relationship
      module ManyToMany

      private

        def one_to_many_options
          super.merge(:constraint => @constraint)
        end

        # Checks that the constraint type is appropriate to the relationship
        #
        # @param [Fixnum] cardinality
        #   cardinality of relationship
        # @param [Symbol] name
        #   name of relationship to evaluate constraint of
        # @param [Hash] options
        #   options hash
        #
        # @option *args :constraint[Symbol]
        #   one of VALID_CONSTRAINT_VALUES
        #
        # @raise ArgumentError
        #   if @option :constraint is not one of VALID_CONSTRAINT_TYPES
        #
        # @return [Undefined]
        #
        # @api private
        def assert_valid_constraint
          super

          # TODO: is any constraint valid for a m:m relationship?
          if @constraint == :set_nil
            raise ArgumentError, "#{@constraint} is not a valid constraint type for #{self.class}"
          end
        end

      end # module ManyToMany
    end # module Relationship
  end # module Constraints

  Associations::ManyToMany::Relationship::OPTIONS << :constraint

  Associations::ManyToMany::Relationship.class_eval do
    include Constraints::Relationship::ManyToMany
  end
end # module DataMapper
