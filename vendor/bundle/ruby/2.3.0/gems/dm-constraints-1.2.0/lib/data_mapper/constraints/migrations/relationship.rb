module DataMapper
  module Constraints
    module Migrations
      module Relationship
        # @api private
        def auto_migrate_constraints_up(repository_name)
          # no-op
        end

        # @api private
        def auto_migrate_constraints_down(repository_name)
          # no-op
        end

        module ManyToOne
          # @api private
          def auto_migrate_constraints_up(repository_name)
            adapter = DataMapper.repository(repository_name).adapter
            adapter.create_relationship_constraint(self)
            self
          end

          # @api private
          def auto_migrate_constraints_down(repository_name)
            adapter = DataMapper.repository(repository_name).adapter
            adapter.destroy_relationship_constraint(self)
            self
          end
        end

      end # module Relationship
    end # module Migrations
  end # module Constraints

  Associations::Relationship.class_eval do
    include Constraints::Migrations::Relationship
  end

  Associations::ManyToOne::Relationship.class_eval do
    include Constraints::Migrations::Relationship::ManyToOne
  end
end # module DataMapper
