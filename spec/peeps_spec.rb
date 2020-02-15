# require 'peeps'
# require 'database_helpers'


# describe Peeps do 
#   describe "#all" do 
#     it 'returns a list of bookmarks' do
#       connection = PG.connect(dbname: 'chitter_test')

#       peep = Peep.create(content: "This is the first test peep")
#       Peep.create(content: "This is the second test peep")
#       Peep.create(content: "This is the third test peep")
  
#       peeps = Peeps.all

#       expect(peeps.length).to eq 3
#       expect(peeps.first).to be_a Peep
#       expect(peeps.first.id).to eq peep.id
#       expect(peeps.first.content).to eq "This is the first test peep"
#     end
#   end
# end 
