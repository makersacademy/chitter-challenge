require "peep"

describe Peep do
  describe ".create" do
    it "creates a new peep" do
      peep = Peep.create(peeptext: "This is a test peep", dateposted: "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}", time_posted: "#{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}")

      expect(peep).to be_a Peep
      expect(peep.peeptext).to eq "this is a test peep"
    end
  end
end
