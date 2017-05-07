require 'spec'
require 'isolated/require_spec'
require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'

# To really test this behavior, this spec needs to be run in isolation and not
# as part of the typical rake spec run, which requires dm-transactions upfront

Spec::Runner.configure do |config|
  config.extend(DataMapper::Spec::Adapters::Helpers)
end

describe "require 'dm-constraints' after calling DataMapper.setup" do

  before(:all) do

    @adapter = DataMapper::Spec.adapter
    require 'dm-constraints'

    class ::Person
      include DataMapper::Resource
      property :id, Serial
      has n, :tasks
    end

    class ::Task
      include DataMapper::Resource
      property :id, Serial
      belongs_to :person
    end

  end

  it_should_behave_like "require 'dm-constraints'"

end
