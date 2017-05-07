require 'dm-core'

require 'data_mapper/constraints/resource'

require 'data_mapper/constraints/migrations/model'
require 'data_mapper/constraints/migrations/relationship'
require 'data_mapper/constraints/migrations/singleton_methods'

require 'data_mapper/constraints/relationship/one_to_many'
require 'data_mapper/constraints/relationship/many_to_many'

require 'data_mapper/constraints/adapters/extension'
require 'data_mapper/constraints/adapters/abstract_adapter'

module DataMapper
  module Constraints
    VALID_CONSTRAINT_VALUES = [ :protect, :destroy, :destroy!, :set_nil, :skip ].to_set.freeze
  end
end
