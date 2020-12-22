require 'peep'

describe Peep do

  describe 'self.all' do
    it "returns an empty array when no peeps have been added" do
      expect(described_class.all).to eq([])
    end
  end

  describe 'self.add' do
    it "takes a single argument" do
      expect(described_class).to respond_to(:add).with(1).argument
    end
    it "adds a single peep" do
      described_class.add("added peep")
      expect(described_class.all).to eq(["added peep"])
    end
    it "adds multiple peeps" do
      described_class.add("another added peep")
      expect(described_class.all).to eq(["added peep", "another added peep"])
    end
  end

end
