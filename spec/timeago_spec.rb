require 'timeago'
describe TimeAgo do
  let(:under_minute) {Time.new - 59}
  let(:under_hour) {Time.new - 3599}
  let(:under_day) {Time.new - 86399}
  let(:over_day) {Time.new - 86401}

  context "when passing TimeAgo a Time less than a minute" do
    it "will give the time in seconds" do
      expect(described_class.run(under_minute)).to eq "59 seconds"
    end
  end
  context "when passing TimeAgo a Time less than an hour" do
    it "will give the time in minutes" do
      expect(described_class.run(under_hour)).to eq "59 minutes"
    end
  end
  context "when passing TimeAgo a Time less than a day" do
    it "will give the time in hours" do
      expect(described_class.run(under_day)).to eq "23 hours"
    end
  end
  context "when passing TimeAgo a Time more than a day" do
    it "will give the time in days" do
      expect(described_class.run(over_day)).to eq "1 day"
    end
  end
end