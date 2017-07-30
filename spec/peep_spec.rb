require './app/models/peep'

describe Peep do

  let!(:peep) do
    Peep.create(peeps: 'Hello World')
  end

  it 'returns a string' do
    expect(peep.peeps).to eq 'Hello World'
  end
end
