module DataMapper
  module Constraints
    module Relationship
      module OneToMany

        attr_reader :constraint

        # @api private
        def enforce_destroy_constraint(resource)
          return true unless association = get(resource)

          constraint = self.constraint

          case constraint
          when :protect
            Array(association).empty?
          when :destroy, :destroy!
            association.__send__(constraint)
          when :set_nil
            Array(association).all? do |resource|
              resource.update(inverse => nil)
            end
          when :skip
            true  # do nothing
          end
        end

      private

        ##
        # Adds the delete constraint options to a relationship
        #
        # @param params [*ARGS] Arguments passed to Relationship#initialize
        #
        # @return [nil]
        #
        # @api private
        def initialize(*args)
          super
          set_constraint
          assert_valid_constraint
        end

        def set_constraint
          @constraint = @options.fetch(:constraint, :protect) || :skip
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
        #   if @option :constraint is not one of VALID_CONSTRAINT_VALUES
        #
        # @return [Undefined]
        #
        # @api semipublic
        def assert_valid_constraint
          return unless @constraint

          unless VALID_CONSTRAINT_VALUES.include?(@constraint)
            raise ArgumentError, ":constraint option must be one of #{VALID_CONSTRAINT_VALUES.to_a.join(', ')}"
          end
        end

      end # module OneToMany
    end # module Relationship
  end # module Constraints

  Associations::OneToMany::Relationship::OPTIONS << :constraint

  Associations::OneToMany::Relationship.class_eval do
    include Constraints::Relationship::OneToMany
  end
end # module DataMapper
