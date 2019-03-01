require 'peep'

describe 'Peep' do
  it 'returns all peeps' do
    peeps = Peep.all
    p "peeps: #{peeps}"
    peep = peeps[0]
    p "peep: #{peep}"
    expect(peep.message).to eq('The first ever peep')
  end
end
