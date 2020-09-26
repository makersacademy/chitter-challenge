require 'peep'
require 'setup_test_database'
describe Peep do
	 describe "#all" do 
 		 it "shows all of the peeps on the website" do
  			 PG.connect(dbname: 'chitter_test')
  			 Peep.create(content: 'Well its friday!')
				 Peep.create(content: 'Ready for the weekend?')
				 Peep.create(content: 'It is no longer friday!')
  			 peeps = Peep.all 
				 expect(peeps.length).to eq 3
				 expect(peeps.first).to be_a Peep
  		end 
 	end	

	 describe "#create" do
 		 it "Adds a new peep to the peeps website" do
				 peep = Peep.create(content: "Is this working?")
				 persisted_data = persisted_data(id: peep.id)
				 expect(peep).to be_a Peep
				 expect(peep.id).to eq persisted_data["id"]
  		end 
 	end 
end
