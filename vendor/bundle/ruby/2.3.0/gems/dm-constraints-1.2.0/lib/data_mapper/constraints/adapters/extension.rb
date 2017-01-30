module DataMapper
  module Constraints
    module Adapters
      module Extension
        # Include the corresponding Constraints module into a adapter class
        #
        # @param [Symbol] const_name
        #   demodulized name of the adapter class to include corresponding
        #   constraints module into
        #
        # TODO: come up with a better way to include modules
        # into all currently loaded and subsequently loaded Adapters
        #
        # @api private
        def include_constraint_api(const_name)
          require constraint_extensions(const_name)

          if Constraints::Adapters.const_defined?(const_name)
            adapter = const_get(const_name)
            constraint_module = Constraints::Adapters.const_get(const_name)
            adapter.class_eval { include constraint_module }
          end
        rescue LoadError
          # Silently ignore the fact that no adapter extensions could be required
          # This means that the adapter in use doesn't support constraints
        end

      private

        # @api private
        def constraint_extensions(const_name)
          name = adapter_name(const_name)
          name = 'do' if name == 'dataobjects'
          "data_mapper/constraints/adapters/#{name}_adapter"
        end

        # @api private
        def const_added(const_name)
          include_constraint_api(const_name)
          super
        end

      end # module Extension
    end # module Adapters
  end # module Constraints

  Adapters.extend Constraints::Adapters::Extension

end # module DataMapper
