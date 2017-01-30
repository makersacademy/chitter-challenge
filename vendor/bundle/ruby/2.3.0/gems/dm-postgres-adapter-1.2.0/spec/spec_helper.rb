require 'dm-core/spec/lib/pending_helpers'

Spec::Runner.configure do |config|
  config.include(DataMapper::Spec::PendingHelpers)
end
