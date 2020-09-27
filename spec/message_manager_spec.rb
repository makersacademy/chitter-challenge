require "message_manager"

describe MessageManager do
  let(:message_double) { double :message, content: "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend." }
  let(:message_double_two) { double :message, content: "If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?" }
  let(:message_double_three) { double :message, content: "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently." }

  describe "#store and #all" do
    it "returns all stored messages" do
      clear_database_table()
      MessageManager.store(message_double)
      MessageManager.store(message_double_two)
      MessageManager.store(message_double_three)
      expect(MessageManager.all[0].content).to include("Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend.")
      expect(MessageManager.all[1].content).to include("If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?")
      expect(MessageManager.all[2].content).to include("If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently.")
    end
  end
end
