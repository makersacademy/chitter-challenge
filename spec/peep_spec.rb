require 'peep'

describe 'Peep' do
  it 'returns all peeps in reverse chronological order' do
    peeps = Peep.all
    p "peeps: #{peeps}"
    peep = peeps[0]
    p "peep: #{peep}"
    expect(peep.message).to eq('The second ever peep')
  end
end
