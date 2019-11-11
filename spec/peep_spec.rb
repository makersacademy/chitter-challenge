require 'peep'

describe Peep do
  it 'makes a new peep' do
    expect(Peep.create(text: 'test').text).to eq 'test'
  end
end
