require 'peep'

describe Peep do

  describe ".all" do
    it "should return all peeps" do
      Peep.create(content: 'HELLO')
      peep = Peep.all.first 
      expect(peep).to be_a Peep
      expect(peep.content).to eq 'HELLO'

    end
  end
  describe ".create" do
    it "should create a peep" do
      Peep.create(content: "hello there")
      expect(Peep.all.first.content).to eq "hello there"
    
    end
  end
end