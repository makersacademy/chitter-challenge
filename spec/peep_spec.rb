require 'peep'

describe 'Peep' do

  it 'allows user to create a peep' do
    new_peep = Peep.create(body: "test peep")
    # expect(new_peep).to eq "test peep"
  end

  it 'returns all peeps' do
    peeps = Peep.all
    # expect(peeps).to include('First test peep')
    # expect(peeps).to include('Second test peep')
    # expect(peeps).to include('Third test peep')
  end

end
