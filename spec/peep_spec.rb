require 'peep'

describe Peep do

let(:peep) {Peep.new("example peep", "12:00")}

  it "is initialized with 2 arguments" do
    expect(described_class).to respond_to(:new).with(2).arguments
  end
  it "has content which can be accessed" do
    expect(peep.content).to eq("example peep")
  end
  it "has a time which can be accessed" do
    expect(peep.time).to eq("12:00")
  end

  describe 'self.all' do
    context "no peeps added" do
      it "returns an empty array when no peeps have been added" do
        expect(described_class.all).to eq([])
      end
    end
    context "multiple peeps added" do
      before(:each) do
        described_class.add("peep1", "time")
        described_class.add("peep2", "time")
        described_class.add("peep3", "time")
      end
      it "returns an array of peep instances" do
        expect(described_class.all).to be_an(Array)
        expect(described_class.all.first).to be_a(Peep)
      end
      it "returns the array in chronological order" do
        expect(described_class.all.last.content).to eq("peep3")
      end
    end
  end

  describe 'self.add' do
    it "takes a two arguments" do
      expect(described_class).to respond_to(:add).with(2).arguments
    end
    it "adds a single peep" do
      described_class.add("added peep", "time")
      expect(described_class.all.first.content).to eq("added peep")
      expect(described_class.all.first.time).to eq("time")
    end
    it "adds multiple peeps" do
      described_class.add("added peep", "time")
      described_class.add("another added peep", "time")
      expect(described_class.all.first.content).to eq("added peep")
      expect(described_class.all.last.content).to eq("another added peep")
      expect(described_class.all.last.time).to eq("time")

    end
  end

end
