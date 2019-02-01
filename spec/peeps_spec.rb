require 'peeps'

describe Peeps do
  it 'can be create a new peep' do
    peep = Peeps.add(peep: 'New peep')
    expect(peep.peep).to eq 'New peep'
  end

  it 'is possible to see a list of peeps' do
    expect { Peeps.add(peep: 'New peep') }.to change { Peeps.list.count }.by 1
  end
end
