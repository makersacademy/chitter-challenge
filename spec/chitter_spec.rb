require 'chitter'

describe '.all' do
  it 'returns a peep' do
    peeps = Chitter.all

    expect(peeps).to include "Hello World"
  end
end