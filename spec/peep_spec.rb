require 'peep'

describe Peep do
  it 'holds a peep' do
    Peep.create('Hello, World!')
    expect(Peep.show).to eq 'Hello, World!'
  end
end