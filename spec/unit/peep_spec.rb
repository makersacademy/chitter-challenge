

require 'peep'

describe Peep do

  describe ".all" do
    it "should return all peeps" do
      Peep.create(content: 'HELLO')
      peep = Peep.all.first 
      expect(peep).to be_a Peep
      expect(peep.content).to eq 'HELLO'

    end

    it "should return them in reverse chrnological order" do
      Peep.create(content: 'first')
      Peep.create(content: 'second')
      peeps = Peep.all
      expect(peeps.first.content).to eq 'second'
    end
  end

  describe ".create" do

    before { Peep.create(content: "hello there") }
    let(:peep) { Peep.all.first }

    it "should create a peep" do
      
      expect(peep.content).to eq "hello there"
      
    
    end

    it "should have a date" do

      expect(peep.date).to eq Date.today.to_s
      
    end

    

  end
end
