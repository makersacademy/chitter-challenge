require './app/models/peep'

describe Peep do
  let!(:peep) do
    Peep.create(peeps: 'Hello World', time: '10:32')
  end

  it 'returns a string' do
    expect(peep.peeps).to eq 'Hello World'
  end

  it 'returns the time' do
    expect(peep.time).to eq '10:32'
  end
end
