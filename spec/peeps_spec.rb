require 'peep'

describe Peep do
	describe "#all" do 
		it "shows all of the peeps on the website" do
			connection = PG.connect(dbname: 'chitter_test')
			connection.exec("INSERT INTO chitters (content) VALUES ('Well its friday!');")
			connection.exec("INSERT INTO chitters (content) VALUES ('Ready for the weekend?');")
			peeps = Peep.all 
			expect(peeps).to include("Well its friday!")
			expect(peeps).to include("Ready for the weekend?")
		end 
	end	
end