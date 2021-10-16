require './lib/peep'
#require 'database_helper'


describe Peep do 
  describe '.add' do 
    it 'adds a new peep to the list of peeps' do 
      peep = Peep.add(contents: "I'm having a good day")

      expect(peep).to be_a Peep
      expect(peep.contents).to eq "I'm having a good day"
      expect(Peep.all).not_to be_empty 
    end 
  end 
end 