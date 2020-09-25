require 'peep'

describe Peep do
	describe "#all" do 
		it "shows all of the peeps on the website" do
			connection = PG.connect(dbname: 'chitter_test')
			Peep.create(content: 'Well its friday!')
			Peep.create(content: 'Ready for the weekend?')
			peeps = Peep.all 
			expect(peeps).to include("Well its friday!")
			expect(peeps).to include("Ready for the weekend?")
		end 
	end	

	describe "#create" do
		it "Adds a new peep to the peeps website" do
			Peep.create(content: 'Finally I am done!')
			expect(Peep.all).to include "Finally I am done!"
		end 
	end 
end