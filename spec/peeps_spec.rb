require 'peeps'

describe Peeps do
  it 'stores in the database a new peep' do
    Peeps.add("peep peep peep")

    expect(Peeps.all).to include "peep peep peep"
  end

end