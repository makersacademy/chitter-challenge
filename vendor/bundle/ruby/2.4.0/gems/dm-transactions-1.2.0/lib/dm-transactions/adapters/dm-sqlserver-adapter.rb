require 'dm-transactions/adapters/dm-do-adapter'

module DataMapper
  class Transaction

    module SqlserverAdapter
      include DataObjectsAdapter
    end

  end
end
