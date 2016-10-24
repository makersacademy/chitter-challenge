require_relative '../app/datamapper_setup'
require_relative '../app/models/peep'

describe Peep do
  subject(:peep) { described_class.new }

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :message }
  it { is_expected.to have_property :created_at }
  it { is_expected.to belong_to :user }

end
