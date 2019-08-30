require 'peep'

describe Peep do
  it 'creates a peep' do
    peep = Peep.create('My first peep')
    expect(peep.id).to eq('1')
    expect(peep.content).to eq('My first peep')
    # expect(peep.time).to eq(?)
    expect(peep.user_id).to eq('1')
  end
end
