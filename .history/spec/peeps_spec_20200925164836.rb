require 'peep'

describe Peep do
	describe "#all" do 
		it "shows all of the peeps on the website" do
			peeps = Peeps.all 
			expect(peeps).to include("Well its friday!")
			expect(peeps).to include("Ready for the weekend?")
		end 
	end
end
