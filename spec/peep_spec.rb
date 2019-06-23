require 'peep'

describe Peep do
  describe '.all' do
    it "returns all peeps" do
      Peep.create(content: "Fake news!")
      Peep.create(content: "Sun''s out, guns out")

      peeps = Peep.all

      expect(peeps.last.content).to eq("Fake news!")
      expect(peeps.first.content).to eq("Sun's out, guns out")
    end
  end

  describe '.create' do
    it "adds a new peep to the database" do
      Peep.create(content: "Test peep")

      expect(Peep.all.first.content).to eq("Test peep")
    end

    it "stores timestamp" do
      peep = Peep.create(content: "Test peep")

      expect(peep).to respond_to(:created_at)
    end
  end

  describe '#time' do
    it "stores the time peep was composed" do
      peep = Peep.create(content: 'Test peep')

      expect(peep.time).to match(/\d{2}:\d{2}/)
      expect(peep.time[0..1].to_i).to be_between(0, 23).inclusive
      expect(peep.time[3..4].to_i).to be_between(0, 59).inclusive
    end
  end
end
