require 'peep'

describe 'Peep' do
  it "returns all peeps" do
    peeps = Peep.all

    expect(peeps).to include("UNTIL")
    expect(peeps).to include("Something very big")
    expect(peeps).to include("I am slow to learn")
    expect(peeps).to include("The secret of life.")
  end
end
