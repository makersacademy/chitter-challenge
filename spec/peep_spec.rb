describe Peep do

  describe "#create" do
    it "responds to create" do
      expect(described_class).to respond_to(:create).with(1).argument
    end
    it "creates a peep" do
      new_peep = described_class.create('first comment')
      expect(new_peep.content).to eq('first comment')
    end
  end
end
