require 'peep'

describe Peep do
  describe ".all" do
    it "returns all peeps made in reverse chronological order" do
      test_database_setup

      Peep.create("Hello World!")
      Peep.create("This breakfast is amazing!")
      peep = Peep.create("I just read the most interesting article")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_instance_of Peep
      expect(peeps.first.content).to eq "I just read the most interesting article"
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.created_at).to eq peep.created_at
      expect(peeps[1].content).to eq "This breakfast is amazing!"
      expect(peeps.last.content).to eq "Hello World!"
    end
  end

  describe ".create" do
    it "creates a new peep" do
      test_database_setup

      peep = Peep.create("I am obsessed with this new pizza joint!")

      expect(peep.content).to eq "I am obsessed with this new pizza joint!"
      expect(peep).to be_instance_of Peep
    end
  end
end
