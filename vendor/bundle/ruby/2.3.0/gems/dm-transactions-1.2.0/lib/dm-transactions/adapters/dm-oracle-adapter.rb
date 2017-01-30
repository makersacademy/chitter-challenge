require 'dm-transactions/adapters/dm-do-adapter'

module DataMapper
  class Transaction

    module OracleAdapter
      include DataObjectsAdapter
    end

  end
end
