require 'peep'

describe Peep do
  describe '.all' do
    it "returns all peeps" do
      peeps = Peep.all

      expect(peeps.first.content).to eq("Fake news!")
      expect(peeps[1].content).to include("Sun's out, guns out")
    end
  end

  describe '.create' do
    it "adds a new peep to the database" do
      Peep.create(content: "Test peep")

      expect(Peep.all.last.content).to eq("Test peep")
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
    end
  end
end
