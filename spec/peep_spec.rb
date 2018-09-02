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

  describe "#all" do
      # let(:peep1) {Peep.create('first')}
      # let(:peep2) {Peep.create('second')}

    xit "returns all peeps" do
      # peep1
      # peep2
      # expect(described_class.all).to include "first"
      # expect(described_class.all).to include "second"
    end

    xit "returns all peeps in reverse chronological order" do
      # expect(described_class.all).to eq ['second', 'first']
    end
  end


  # how to test timestamp? peep1.timestamp eq Time.now?

end
