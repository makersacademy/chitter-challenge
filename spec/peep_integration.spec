require 'peep'
require 'peeprepository'

RSpec.describe PeepRepository do
  it "displays all peeps" do
    new_peep = Peep.new("first peep")
    all_peeps = PeepRepository.new
    all_peeps.add(new_peep)
    expect(all_peeps.all).to eq [new_peep]
  end
end
