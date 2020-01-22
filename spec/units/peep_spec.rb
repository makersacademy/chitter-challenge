require 'peep'

describe Peep do

  describe ".all" do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: "chitter_test")
      test_peep = Peep.create("This is a test peep")
      Peep.create("this is also a test")
      Peep.create("this is the third test")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.last.message).to eq("This is a test peep")
      expect(peeps.last.id).to eq(test_peep.id)
      expect(peeps.first.created_at).to be_a DateTime
    end
  end

  describe ".create" do
    it "creates a new peep" do
      peep = Peep.create("This is a test peep")

      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq("This is a test peep")
    end
  end

end
