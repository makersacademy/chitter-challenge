require 'peep'

desribe Peep do
	describe "#all" do 
		it "shows all of the peeps on the website" do
			peeps = Peeps.all 
			expect(peeps).to include("Thank for its friday!")
			expect(peeps).to include("We made it!")
		end 
	end
end
