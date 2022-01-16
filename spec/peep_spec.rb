require 'peep'

describe '.create' do
  it 'allows the user to create a new peep' do

    peep = Peep.create(message: 'Test peep')
    expect(peep.message).to eq('Test peep')
  end
end
