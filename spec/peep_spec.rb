require 'peep'

describe Peep do

let(:peep) {Peep.new("example peep", "12:00", "bob")}

  it "is initialized with 3 arguments" do
    expect(described_class).to respond_to(:new).with(3).arguments
  end
  it "has content which can be accessed" do
    expect(peep.content).to eq("example peep")
  end
  it "has a time which can be accessed" do
    expect(peep.time).to eq("12:00")
  end
  it "has a username which can be accessed" do
    expect(peep.username).to eq("bob")
  end

  describe 'self.all' do
    context "no peeps added" do
      it "returns an empty array when no peeps have been added" do
        expect(described_class.all).to eq([])
      end
    end
    context "multiple peeps added" do
      before(:each) do
        described_class.add("peep1", "time", "bob1")
        described_class.add("peep2", "time", "bob2")
        described_class.add("peep3", "time", "bob3")
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
    it "takes a three arguments" do
      expect(described_class).to respond_to(:add).with(3).arguments
    end
    it "adds a single peep" do
      described_class.add("added peep", "time", "username")
      expect(described_class.all.first.content).to eq("added peep")
      expect(described_class.all.first.time).to eq("time")
      expect(described_class.all.first.username).to eq("username")

    end
    it "adds multiple peeps" do
      described_class.add("added peep", "time1", "bob")
      described_class.add("another added peep", "time2", "margaret")
      expect(described_class.all.length).to eq(2)
      expect(described_class.all.first.content).to eq("added peep")
      expect(described_class.all.first.time).to eq("time1")
      expect(described_class.all.first.username).to eq("bob")
      expect(described_class.all.last.content).to eq("another added peep")
      expect(described_class.all.last.time).to eq("time2")
      expect(described_class.all.last.username).to eq("margaret")
    end
  end

end
