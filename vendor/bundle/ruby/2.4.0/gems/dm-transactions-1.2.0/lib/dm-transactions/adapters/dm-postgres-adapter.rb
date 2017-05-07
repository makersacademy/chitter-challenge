require 'dm-transactions/adapters/dm-do-adapter'

module DataMapper
  class Transaction

    module PostgresAdapter
      include DataObjectsAdapter

      def supports_savepoints?
        true
      end
    end

  end
end
