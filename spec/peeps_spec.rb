require 'peeps'
require_relative 'database_helpers'

describe Peeps do

   describe '.all' do
     it 'returns all peeps/messages' do

       peep =  Peeps.add(message: "Tired")
       Peeps.add(message: "Hungry")
       Peeps.add(message: "lonely")


       timeline = Peeps.all

       expect(timeline.first).to be_a(Peeps)
       expect(timeline.first.id).to eq timeline.id
       expect(timeline.peep).to include("Tired")
       end
     end

  describe '.add' do
    it 'allows user to add a new peep/message post' do
    peeps =  Peeps.add(message: "Tired")
    persisted_data = persisted_data(id: peeps.id)



      expect(peeps).to be_a Peeps
      expect(peeps.id).to eq persisted_data.first['id']
      expect(peeps.peep).to eq "Tired"
    end
  end
end
