require 'spec_helper'
require 'timecop'

describe Peep do

  it 'creates a peep entry' do
    expect {post_peep}.to change(Peep, :count).by(1)
    expect(Peep.first.peep).to eq "Got such cheese munchies"
  end

  it 'has the time of the peep attached' do
    Timecop.freeze do
      post_peep
      expect(Peep.first.time.to_i).to eq Time.now.to_i
    end
  end

end
