require 'spec_helper'

describe Peep do

  it 'creates a peep entry' do
    expect {post_peep}.to change(Peep, :count).by(1)
    expect(Peep.first.peep).to eq "Got such cheese munchies"
  end

end
