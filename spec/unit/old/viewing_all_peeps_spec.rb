# require 'spec_helper'
# require 'database_helpers'

# describe Peep do
#   describe '.all' do
#     it "returns all peeps" do
#       connection = PG.connect(dbname: 'chitter_test')
      
#       #test data
#       peep = Peep.create(message: "Message 1", name: "Jo")
#       Peep.create(message: "Message 2", name: "John")
#       Peep.create(message: "Message 3", name: "Sam")
#       persisted_data = persisted_data(id: peep.id)

#       peeps = Peep.all 
      
#       expect(peeps.length).to eq 3
#       expect(peeps.first).to be_a Peep
#       expect(peep.id).to eq persisted_data['id']
#       expect(peeps.first.name).to eq 'Jo'
#       expect(peeps.first.message).to eq 'Message 1'
#     end
#   end
# end