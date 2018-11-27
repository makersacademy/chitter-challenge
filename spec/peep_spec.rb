require 'peep'

describe Peep do

  it { should have_property  :id }
  it { should have_property  :username }
  it { should have_property  :body }
  it { should have_property  :created_at }
  it { should belong_to      :user }

end
