require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'
require 'dm-core/spec/lib/pending_helpers'

require 'dm-aggregates'
require 'dm-migrations'

require 'public/shared/aggregate_shared_spec'

DataMapper::Spec.setup

Spec::Runner.configure do |config|

  config.extend(DataMapper::Spec::Adapters::Helpers)
  config.include(DataMapper::Spec::PendingHelpers)

  config.before(:all) do

    # A simplistic example, using with an Integer property
    class ::Knight
      include DataMapper::Resource

      property :id,   Serial
      property :name, String
    end

    class ::Dragon
      include DataMapper::Resource

      property :id,                Serial
      property :name,              String
      property :is_fire_breathing, Boolean
      property :toes_on_claw,      Integer
      property :birth_at,          DateTime
      property :birth_on,          Date
      property :birth_time,        Time

      belongs_to :knight, :required => false
    end

    # A more complex example, with BigDecimal and Float properties
    # Statistics taken from CIA World Factbook:
    # https://www.cia.gov/library/publications/the-world-factbook/
    class ::Country
      include DataMapper::Resource

      property :id,                  Serial
      property :name,                String,  :required => true
      property :population,          Integer
      property :birth_rate,          Float,   :precision => 4,  :scale => 2
      property :gold_reserve_tonnes, Float,   :precision => 6,  :scale => 2
      property :gold_reserve_value,  Decimal, :precision => 15, :scale => 1  # approx. value in USD
    end
    DataMapper.finalize

  end
end
