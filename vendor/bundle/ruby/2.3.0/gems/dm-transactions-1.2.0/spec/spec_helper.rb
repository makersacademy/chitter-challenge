require 'dm-transactions'

require 'dm-core/spec/setup'
require 'dm-core/spec/lib/spec_helper'
require 'dm-core/spec/lib/pending_helpers'
require 'dm-core/spec/lib/adapter_helpers'
require 'dm-core/spec/lib/counter_adapter'
require 'dm-core/spec/shared/resource_spec'
require 'dm-core/spec/shared/sel_spec'

Spec::Runner.configure do |config|

  config.extend(DataMapper::Spec::Adapters::Helpers)
  config.include(DataMapper::Spec::PendingHelpers)

  config.after :all do
    DataMapper::Spec.cleanup_models
  end

end
