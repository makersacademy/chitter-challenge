require 'peep'

describe Peep do
	it "creates a new peep" do
		Peep.create("Its a fine day to be a Maker")
		expect(Peep.all).to include "Its a fine day to be a Maker"
	end
end