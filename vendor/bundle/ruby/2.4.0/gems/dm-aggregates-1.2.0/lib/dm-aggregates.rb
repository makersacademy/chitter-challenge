require 'dm-core'

require 'dm-aggregates/aggregate_functions'
require 'dm-aggregates/collection'
require 'dm-aggregates/core_ext/symbol'
require 'dm-aggregates/model'
require 'dm-aggregates/query'
require 'dm-aggregates/repository'

module DataMapper
  module Aggregates
    def self.include_aggregate_api
      [ :Repository, :Model, :Collection, :Query ].each do |name|
        DataMapper.const_get(name).send(:include, const_get(name))
      end
      Adapters::AbstractAdapter.descendants.each do |adapter_class|
        Adapters.include_aggregate_api(DataMapper::Inflector.demodulize(adapter_class.name))
      end
    end
  end

  module Adapters

    def self.include_aggregate_api(const_name)
      require aggregate_extensions(const_name)
      if Aggregates.const_defined?(const_name)
        adapter = const_get(const_name)
        adapter.send(:include, aggregate_module(const_name))
      end
    rescue LoadError
      # Silently ignore the fact that no adapter extensions could be required
      # This means that the adapter in use doesn't support aggregates
    end

    def self.aggregate_module(const_name)
      Aggregates.const_get(const_name)
    end

    class << self
    private
      # @api private
      def aggregate_extensions(const_name)
        name = adapter_name(const_name)
        name = 'do' if name == 'dataobjects'
        "dm-aggregates/adapters/dm-#{name}-adapter"
      end
    end

    extendable do
      # @api private
      def const_added(const_name)
        include_aggregate_api(const_name)
        super
      end
    end
  end # module Adapters

  Aggregates.include_aggregate_api

end # module DataMapper
