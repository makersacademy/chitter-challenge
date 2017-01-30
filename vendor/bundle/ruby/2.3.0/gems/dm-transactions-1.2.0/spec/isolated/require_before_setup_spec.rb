require 'spec'
require 'isolated/require_spec'
require 'dm-core/spec/setup'

# To really test this behavior, this spec needs to be run in isolation and not
# as part of the typical rake spec run, which requires dm-transactions upfront

if %w[ postgres mysql sqlite oracle sqlserver ].include?(ENV['ADAPTER'])

  describe "require 'dm-transactions' before calling DataMapper.setup" do

    before(:all) do
      require 'dm-transactions'
      @adapter = DataMapper::Spec.adapter
    end

    it_should_behave_like "require 'dm-transactions'"

  end

end
