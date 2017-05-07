require 'spec'
require 'isolated/require_spec'
require 'dm-core/spec/setup'

# To really test this behavior, this spec needs to be run in isolation and not
# as part of the typical rake spec run, which requires dm-aggregates upfront

if %w[ postgres mysql sqlite oracle sqlserver ].include?(ENV['ADAPTER'])

  describe "require 'dm-aggregates' before calling DataMapper.setup" do

    before(:all) do
      require 'dm-aggregates'
      @adapter = DataMapper::Spec.adapter
    end

    it_should_behave_like "require 'dm-aggregates'"

  end

end
