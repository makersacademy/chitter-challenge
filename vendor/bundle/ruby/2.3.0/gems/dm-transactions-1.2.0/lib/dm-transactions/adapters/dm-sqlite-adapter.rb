require 'dm-transactions/adapters/dm-do-adapter'

module DataMapper
  class Transaction

    module SqliteAdapter
      include DataObjectsAdapter
    end

  end
end
