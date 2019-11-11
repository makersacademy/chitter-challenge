require 'peep'

describe Peep do
  subject(:test_peep) { described_class.new(peep: 'test message', username: 'TestUser', post_time: '00:00') }

  it 'shows peep message' do
    expect(test_peep.peep).to eq 'test message'
  end

  it 'shows username' do
    expect(test_peep.username).to eq 'TestUser'
  end
end
