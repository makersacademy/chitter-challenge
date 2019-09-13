require 'peeps'

describe Peeps do

   describe '.all' do
     it 'returns all peeps/messages' do

       Peeps.add(message: "Tired")
       Peeps.add(message: "Hungry")
       Peeps.add(message: "lonely")


       timeline = Peeps.all

       expect(timeline).to include("Tired")
       expect(timeline).to include("Hungry")
       expect(timeline).to include("lonely")
       end
     end

  describe '.add' do
    it 'allows user to add a new peep/message post' do
      Peeps.add(message: "Tired")
      Peeps.add(message: "Hungry")
      Peeps.add(message: "lonely")

      expect(Peeps.all).to include "Tired"
      expect(Peeps.all).to include "Hungry"
      expect(Peeps.all).to include "lonely"
    end
  end
end
