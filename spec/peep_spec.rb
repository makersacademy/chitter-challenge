require 'Peep'

describe Peep do

  describe '.all' do
    it 'should return all peeps' do
      peeps = Peep.all
      expect(peeps).to include "Happy Sunday!"
    end
  end

  describe '.add' do
    
    it 'should add a new post with date and content to the peeps' do
      Peep.add("09/12/19", "Time to finish the challenge and go to bed!")
      expect(Peep.all.first.date).to eq "09/12/19"
      expect(Peep.all.first.content).to eq "Time to finish the challenge and go to bed!"
    end
end


