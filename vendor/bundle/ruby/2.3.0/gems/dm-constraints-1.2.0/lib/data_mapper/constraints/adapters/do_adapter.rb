module DataMapper
  module Constraints
    module Adapters

      module DataObjectsAdapter
        ##
        # Determine if a constraint exists for a table
        #
        # @param storage_name [Symbol]
        #   name of table to check constraint on
        # @param constraint_name [~String]
        #   name of constraint to check for
        #
        # @return [Boolean]
        #
        # @api private
        def constraint_exists?(storage_name, constraint_name)
          statement = DataMapper::Ext::String.compress_lines(<<-SQL)
            SELECT COUNT(*)
            FROM #{quote_name('information_schema')}.#{quote_name('table_constraints')}
            WHERE #{quote_name('constraint_type')} = 'FOREIGN KEY'
            AND #{quote_name('table_schema')} = ?
            AND #{quote_name('table_name')} = ?
            AND #{quote_name('constraint_name')} = ?
          SQL

          select(statement, schema_name, storage_name, constraint_name).first > 0
        end

        ##
        # Create the constraint for a relationship
        #
        # @param relationship [Relationship]
        #   the relationship to create the constraint for
        #
        # @return [true, false]
        #   true if creating the constraints was successful
        #
        # @api semipublic
        def create_relationship_constraint(relationship)
          return false unless valid_relationship_for_constraint?(relationship)

          source_storage_name = relationship.source_model.storage_name(name)
          target_storage_name = relationship.target_model.storage_name(name)
          constraint_name     = constraint_name(source_storage_name, relationship.name)

          return false if constraint_exists?(source_storage_name, constraint_name)

          constraint_type =
            case relationship.inverse.constraint
            when :protect            then 'NO ACTION'
            # TODO: support :cascade as an option:
            #   (destroy doesn't communicate the UPDATE constraint)
            when :destroy, :destroy! then 'CASCADE'
            when :set_nil            then 'SET NULL'
            end

          return false if constraint_type.nil?

          source_keys = relationship.source_key.map { |p| property_to_column_name(p, false) }
          target_keys = relationship.target_key.map { |p| property_to_column_name(p, false) }

          create_constraints_statement = create_constraints_statement(
            constraint_name,
            constraint_type,
            source_storage_name,
            source_keys,
            target_storage_name,
            target_keys)

          execute(create_constraints_statement)
        end

        ##
        # Remove the constraint for a relationship
        #
        # @param relationship [Relationship]
        #   the relationship to remove the constraint for
        #
        # @return [true, false]
        #   true if destroying the constraint was successful
        #
        # @api semipublic
        def destroy_relationship_constraint(relationship)
          return false unless valid_relationship_for_constraint?(relationship)

          storage_name    = relationship.source_model.storage_name(name)
          constraint_name = constraint_name(storage_name, relationship.name)

          return false unless constraint_exists?(storage_name, constraint_name)

          destroy_constraints_statement =
            destroy_constraints_statement(storage_name, constraint_name)

          execute(destroy_constraints_statement)
        end

      private

        ##
        # Check to see if the relationship's constraints can be used
        #
        # Only one-to-one, one-to-many, and many-to-many relationships
        # can be used for constraints.  They must also be in the same
        # repository as the adapter is connected to.
        #
        # @param relationship [Relationship]
        #   the relationship to check
        #
        # @return [true, false]
        #   true if a constraint can be established for relationship
        #
        # @api private
        def valid_relationship_for_constraint?(relationship)
          return false unless relationship.source_repository_name == name || relationship.source_repository_name.nil?
          return false unless relationship.target_repository_name == name || relationship.target_repository_name.nil?
          return false unless relationship.kind_of?(Associations::ManyToOne::Relationship)
          true
        end

        module SQL

        private

          # Generates the SQL statement to create a constraint
          #
          # @param [String] constraint_name
          #   name of the foreign key constraint
          # @param [String] constraint_type
          #   type of constraint to ALTER source_storage_name with
          # @param [String] source_storage_name
          #   name of table to ALTER with constraint
          # @param [Array(String)] source_keys
          #   columns in source_storage_name that refer to foreign table
          # @param [String] target_storage_name
          #   target table of the constraint
          # @param [Array(String)] target_keys
          #   columns the target table that are referred to
          #
          # @return [String]
          #   SQL DDL Statement to create a constraint
          #
          # @api private
          def create_constraints_statement(constraint_name, constraint_type, source_storage_name, source_keys, target_storage_name, target_keys)
            DataMapper::Ext::String.compress_lines(<<-SQL)
              ALTER TABLE #{quote_name(source_storage_name)}
              ADD CONSTRAINT #{quote_name(constraint_name)}
              FOREIGN KEY (#{source_keys.join(', ')})
              REFERENCES #{quote_name(target_storage_name)} (#{target_keys.join(', ')})
              ON DELETE #{constraint_type}
              ON UPDATE #{constraint_type}
            SQL
          end

          ##
          # Generates the SQL statement to destroy a constraint
          #
          # @param [String] storage_name
          #   name of table to constrain
          # @param [String] constraint_name
          #   name of foreign key constraint
          #
          # @return [String]
          #   SQL DDL Statement to destroy a constraint
          #
          # @api private
          def destroy_constraints_statement(storage_name, constraint_name)
            DataMapper::Ext::String.compress_lines(<<-SQL)
              ALTER TABLE #{quote_name(storage_name)}
              DROP CONSTRAINT #{quote_name(constraint_name)}
            SQL
          end

          ##
          # generates a unique constraint name given a table and a relationships
          #
          # @param [String] storage_name
          #   name of table to constrain
          # @param [String] relationship_name
          #   name of the relationship to constrain
          #
          # @return [String]
          #   name of the constraint
          #
          # @api private
          def constraint_name(storage_name, relationship_name)
            identifier = "#{storage_name}_#{relationship_name}"[0, self.class::IDENTIFIER_MAX_LENGTH - 3]
            "#{identifier}_fk"
          end
        end

        include SQL

      end # module DataObjectsAdapter

    end # module Adapters
  end # module Constraints
end # module DataMapper
