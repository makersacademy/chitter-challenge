require 'dm-postgres-adapter'
require 'dm-core/spec/setup'

module DataMapper
  module Spec
    module Adapters

      class PostgresAdapter < Adapter
      end

      use PostgresAdapter

    end
  end
end
