require 'data_mapper/constraints/adapters/do_adapter'

module DataMapper
  module Constraints
    module Adapters

      module OracleAdapter
        include DataObjectsAdapter

        # oracle does not provide the information_schema table
        # To question internal state like postgres or mysql
        #
        # @see DataMapper::Constraints::Adapters::DataObjectsAdapter
        #
        # @api private
        def constraint_exists?(storage_name, constraint_name)
          statement = DataMapper::Ext::String.compress_lines(<<-SQL)
            SELECT COUNT(*)
            FROM USER_CONSTRAINTS
            WHERE table_name = ?
            AND constraint_name = ?
          SQL

          select(statement, oracle_upcase(storage_name)[0, self.class::IDENTIFIER_MAX_LENGTH].gsub('"', '_'), oracle_upcase(constraint_name)[0, self.class::IDENTIFIER_MAX_LENGTH].gsub('"', '_')).first > 0

        end


        # @see DataMapper::Constraints::Adapters::DataObjectsAdapter#create_constraints_statement
        #
        # @api private
        #
        # TODO: is it desirable to always set `INITIALLY DEFERRED DEFERRABLE`?
        def create_constraints_statement(constraint_name, constraint_type, source_storage_name, source_keys, target_storage_name, target_keys)
          DataMapper::Ext::String.compress_lines(<<-SQL)
            ALTER TABLE #{quote_name(source_storage_name)}
            ADD CONSTRAINT #{quote_name(constraint_name)}
            FOREIGN KEY (#{source_keys.join(', ')})
            REFERENCES #{quote_name(target_storage_name)} (#{target_keys.join(', ')})
            #{"ON DELETE " + constraint_type if constraint_type && constraint_type != "NO ACTION"}
            INITIALLY DEFERRED DEFERRABLE
          SQL
        end

        # @api private
        def destroy_constraints_statement(storage_name, constraint_name)
          DataMapper::Ext::String.compress_lines(<<-SQL)
            ALTER TABLE #{quote_name(storage_name)}
            DROP CONSTRAINT #{quote_name(constraint_name)}
            CASCADE
          SQL
        end

      end
    end
  end
end
