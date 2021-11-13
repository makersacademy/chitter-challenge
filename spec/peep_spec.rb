require 'peep'

describe Peep do
	it "creates a new peep" do
		new_peep = Peep.create("Its a fine day to be a Maker").first
		expect(Peep.all.first.message).to eq "Its a fine day to be a Maker"
	end
end