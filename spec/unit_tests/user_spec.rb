require 'user'

describe User do
  it { should have_property :firstname }
  it { should have_property :surname }
  it { should have_property :email }
  it { should have_property :password }
end
