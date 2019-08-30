require 'peep'

describe Peep do
  it 'creates a peep' do
    allow(Time).to receive(:now).and_return('2019-01-01 00:00:00')
    peep = Peep.create('My first peep', 1)
    expect(peep.id).to eq('1')
    expect(peep.content).to eq('My first peep')
    expect(peep.peep_time).to eq('2019-01-01 00:00:00+00')
    expect(peep.user_id).to eq('1')
  end
end
