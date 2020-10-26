require 'peeps'

describe Peeps do
  it 'stores in the database a new peep' do
    Peeps.add("peep peep peep")

    messages = Peeps.all

    messages.each do |peep|
      expect(peep.peep).to include "peep peep peep"
    end
  end

end