require './lib/peep'

describe Peep do

  it 'returns all peeps' do
    
    peeps = Peep.all

    expect(peeps).to include 'Peep #1'
  end

end
