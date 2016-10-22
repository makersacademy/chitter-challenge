require_relative '../app/datamapper_setup'
require_relative '../app/models/post'

describe Post do
  subject(:post) { described_class.new }

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :message }
  it { is_expected.to have_property :created_at }
end
