require 'peep'

describe Peep do

let(:peep) {Peep.new("example peep", "12:00", 1)}

  it "is initialized with 3 arguments" do
    expect(described_class).to respond_to(:new).with(3).arguments
  end
  it "has content which can be accessed" do
    expect(peep.content).to eq("example peep")
  end
  it "has a time which can be accessed" do
    expect(peep.time).to eq("12:00")
  end
  it "has a user_id which can be accessed" do
    expect(peep.user_id).to eq(1)
  end

  describe 'self.all' do
    context "no peeps added" do
      it "returns an empty array when no peeps have been added" do
        expect(described_class.all).to eq([])
      end
    end
    context "one user and multiple peeps added" do
      before(:each) do
        User.add("test user")
        described_class.add("peep1", "time", 1)
        described_class.add("peep2", "time", 1)
        described_class.add("peep3", "time", 1)
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
    context "one user added" do
      before(:each) do
        User.add("test user")
      end
      it "adds a single peep" do
        described_class.add("added peep", "time", 1)
        expect(described_class.all.first.content).to eq("added peep")
        expect(described_class.all.first.time).to eq("time")
        expect(described_class.all.first.user_id).to eq(1)
      end
      it "adds multiple peeps" do
        described_class.add("added peep", "time1", 1)
        described_class.add("another added peep", "time2", 1)
        expect(described_class.all.length).to eq(2)
        expect(described_class.all.first.content).to eq("added peep")
        expect(described_class.all.first.time).to eq("time1")
        expect(described_class.all.first.user_id).to eq(1)
        expect(described_class.all.last.content).to eq("another added peep")
        expect(described_class.all.last.time).to eq("time2")
        expect(described_class.all.last.user_id).to eq(1)
      end
    end
  end

end
