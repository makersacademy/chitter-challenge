describe Peep do
  describe "#extract_hashtags" do
    it "should recognise hashtag in a peep and create a hashtag" do
      user = create_user
      peepers = described_class.create(
        text: "Example #peep",
        timestamp: Time.new(2000, 01, 01),
        user: user
      )
      expect { described_class.extract_hashtags(peepers) }.to change { Hashtag.all.count }.by(1)
    end
  end
end
