require 'peeps'

describe Peeps do
  it 'can be create a new peep' do
    peep = Peeps.add(peep: 'New peep')
    expect(peep.peep).to eq 'New peep'
  end

  it 'is possible to see a list of peeps' do
    expect { Peeps.add(peep: 'New peep') }.to change { Peeps.list.count }.by 1
  end

  it 'can keep track of the time it was posted' do
    peep = Peeps.add(peep: 'New peep')
    expect(peep.time).to eq DateTime.now.to_s
  end
end
