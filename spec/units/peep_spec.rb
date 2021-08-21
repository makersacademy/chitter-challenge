require 'peep'

describe Peep do
  
  describe '#self.all' do
    it 'returns all peeps' do
      Peep.create('hello this is a practice peep')

      expect(Peep.all.length).to eq 1
    end


  end

  describe "#self.add" do
    it "should add a peep to the database" do
      peep = Peep.create('hello this is a practice peep')

      expect(peep).to be_a Peep
    end
  end

end