require 'rubygems'

require 'dm-core/spec/setup'
require 'dm-core/spec/lib/spec_helper'
require 'dm-core/spec/lib/adapter_helpers'
require 'dm-core/spec/lib/pending_helpers'

require 'dm-constraints'

Spec::Runner.configure do |config|

  config.extend(DataMapper::Spec::Adapters::Helpers)
  config.extend(DataMapper::Spec::Helpers)
  config.include(DataMapper::Spec::PendingHelpers)

  config.before(:each) do
    DataMapper.finalize
    DataMapper.auto_migrate!
  end

  config.after :each do
    DataMapper.send(:auto_migrate_down!, DataMapper::Spec.adapter.name)
  end

  config.after :all do
    DataMapper::Spec.cleanup_models
  end

end
