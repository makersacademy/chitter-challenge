describe Peep do
  describe ".all" do
    it "returns all peeps" do
      #test data
      peep = Peep.create(content: "just setting up my chittr")

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq "just setting up my chittr"
    end
  end 
end