require 'peep'
require 'setup_test_db'

describe '.all' do
  it 'returns a list of peeps' do
    
    setup_test_database
    peeps = Peeps.all

    expect(peeps[0].peep).to include "Test peep 3"
    expect(peeps[1].peep).to include "Test peep 2"
    expect(peeps[2].peep).to include "Test peep 1"
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peeps.create('Release the Mega-Peep!')

    peeps = Peeps.all

    expect(peeps[0].peep).to include 'Release the Mega-Peep!'
  end
end
