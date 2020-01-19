require 'peep'
require 'database_helper'

describe Peep do 
  describe '.all' do 
    it 'displays all the peepes in the database' do
      expect(Peep.all.length).to eq 1
    end 
  end 

  describe '.add' do 
    it 'adds a peep to the database' do
      peep = Peep.add('Hey how do')

      expect(peep).to be_a Peep
      expect(peep.message).to eq 'Hey how do'
    end 
  end 
end 