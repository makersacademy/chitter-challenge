describe Peep do
  describe "#time" do
    let(:user_id) { double :user_id }
    let(:now) { Time.parse("2016-03-26 14:58:20 +0000") }

    it "formats the time at which a peep is posted" do
      peep = Peep.create(content: "Meh", user_id: user_id, time_posted: now)
      expect(peep.time).to eq "14:58 26/03/2016"
    end
  end
end
