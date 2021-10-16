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

  describe '.delete' do 
    it 'deletes a given bookmark' do 
      peep = Peep.add(contents: "I'm tired")

      Peep.delete(id: peep.id)

      expect(Peep.all.length).to eq 0
    end 
  end 
end 