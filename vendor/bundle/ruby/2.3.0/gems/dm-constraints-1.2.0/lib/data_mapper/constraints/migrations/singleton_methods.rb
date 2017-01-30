module DataMapper
  module Constraints
    module Migrations
      module SingletonMethods

        def auto_migrate!(repository_name = nil)
          auto_migrate_constraints_down(repository_name)
          # TODO: Model#auto_migrate! drops and adds constraints, as well.
          #   is that an avoidable duplication?
          super
          auto_migrate_constraints_up(repository_name)
          self
        end

      private

        def auto_migrate_down!(repository_name = nil)
          auto_migrate_constraints_down(repository_name)
          super
          self
        end

        def auto_migrate_up!(repository_name = nil)
          super
          auto_migrate_constraints_up(repository_name)
          self
        end

        # @api private
        def auto_migrate_constraints_up(repository_name = nil)
          DataMapper::Model.descendants.each do |model|
            model.auto_migrate_constraints_up(repository_name || model.default_repository_name)
          end
        end

        # @api private
        def auto_migrate_constraints_down(repository_name = nil)
          DataMapper::Model.descendants.each do |model|
            model.auto_migrate_constraints_down(repository_name || model.default_repository_name)
          end
        end

      end # module SingletonMethods
    end # module Migrations
  end # module Constraints

  extend Constraints::Migrations::SingletonMethods
end # module DataMapper
