require 'peeps'

describe ".all" do
  it "stores & shows the peeps" do
    peep = Peep.all
    expect(peep[0].peep).to include("Bobs first day.")
  end
end
