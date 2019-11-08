require "peep"

describe Peep do
  describe ".create" do
    it "creates a new peep" do
      connection = PG.connect(dbname: "chitter_peeps_test")
      peep = Peep.create(id: 1, peeptext: "This is a test peep", username: "guest", dateposted: "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}", timeposted: "#{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}")

      expect(peep).to be_a Peep
      expect(peep.peeptext).to eq "this is a test peep"
    end
  end
end
