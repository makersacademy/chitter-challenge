require "message"
require "timecop"

describe Message do
  describe "#new" do
    before do
      Timecop.freeze(Time.local(2020))
    end
    after do
      Timecop.return
    end
    it "creates a message" do
      test_message = Message.new("Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend.", "test_id")
      expect(test_message.content).to eq "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend."
      expect(test_message.time).to eq Time.local(2020)
      expect(test_message.username).to eq "test_id"
    end
  end
end
