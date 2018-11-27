require 'user'

describe User do

  it { should have_property  :id }
  it { should have_property  :firstname }
  it { should have_property  :lastname }
  it { should have_property  :username }
  it { should have_property  :email }
  it { should have_property  :password }
  it { should have_many      :peeps }
end
