describe Message do
  describe "#new" do
    it "creates a message" do
      test_message = Message.new("Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend.")
      expect(test_message.content).to eq "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend."
    end
  end
end
