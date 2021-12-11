require 'peep'


describe Peep do
	
	context "#create a new peep" do
		it 'A user can create a new peep/message' do
			peep = Peep.create(peep: "First post in Chitter!")

			expect(peep).to be_a Peep
			expect(peep.message).to eq "First post in Chitter!"
		end
	end

end