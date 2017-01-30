require 'dm-transactions/adapters/dm-do-adapter'

module DataMapper
  class Transaction

    module MysqlAdapter
      include DataObjectsAdapter

      def supports_savepoints?
        true
      end
    end

  end
end
