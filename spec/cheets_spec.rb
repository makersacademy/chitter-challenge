require './lib/cheets'

describe Cheets do

  it { should have_property   :id         }
  it { should have_property   :body       }
  it { should have_property   :created_at }
end
