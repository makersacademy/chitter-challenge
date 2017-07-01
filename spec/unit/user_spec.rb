describe User do
  it { is_expected.to be_a User }

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :username }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }

  it { is_expected.to have_many :peeps }
end
