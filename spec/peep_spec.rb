require 'peep'

RSpec.describe Peep do
  let(:test_peep) { Peep.new 'message' }

  it 'can contain a message' do
    expect(test_peep.body).to eq 'message'
  end

  it 'has likes and can be liked' do
    expect { test_peep.like }.to change { test_peep.likes }.by 1
  end

  it 'keeps a record of the time it was posted' do
    expect(test_peep.timestamp).to eq Time.now.utc.strftime '%k:%M'
  end
end
