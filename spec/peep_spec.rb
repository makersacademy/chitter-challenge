require "peep"

describe Peep do
  context ".create"
    it "creates a peep" do
      time_now = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      allow_any_instance_of(Time).to receive(:now).and_return(time_now)
      peep = Peep.create("Hello")

      expect(peep).to be_a Peep
      expect(peep.message).to eq "Hello"
      expect(peep.timestamp).to eq time_now
    end

  context ".all"
    it "returns an array of peeps" do
      Peep.create("Hello")
      Peep.create("Bye")
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps[0]).to be_a Peep
      expect(peeps[1]).to be_a Peep
    end

    it "returns an array of peeps in reverse chronological order" do
      Peep.create("Hello")
      Peep.create("Bye")
      peeps = Peep.all
      
      expect(peeps[0].message).to eq "Bye"
      expect(peeps[1].message).to eq "Hello"
    end
end
