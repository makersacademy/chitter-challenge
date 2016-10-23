require_relative "../app/models/user"

describe User do
  subject(:user) { described_class.new }

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :user_name }
  it { is_expected.to have_property :email }
  it { is_expected.to have_many :posts }

end
