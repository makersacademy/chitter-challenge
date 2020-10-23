require "message_manager"

describe MessageManager do
  describe "feature test" do
    let(:time_double) { double :time, strftime: "2020-01-01T00:00:00.000+0000" }
    let(:message_double) { double :message, content: "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend.", username: "Rara", time: time_double }
    let(:time_double_two) { double :time, strftime: "2020-01-01T00:01:00.000+0000" }
    let(:message_double_two) { double :message, content: "If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?", username: "Rara", time: time_double_two }
    let(:time_double_three) { double :time, strftime: "2020-01-01T00:02:00.000+0000" }
    let(:message_double_three) { double :message, content: "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently.", username: "Rara", time: time_double_three }

    it "returns all stored messages" do
      clear_users_table()
      add_test_user()
      MessageManager.store(message_double)
      MessageManager.store(message_double_two)
      MessageManager.store(message_double_three)
      expect(MessageManager.all[0].content).to include("If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently.")
      expect(MessageManager.all[0].time.to_i).to eq 1_577_836_920
      expect(MessageManager.all[1].content).to include("If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?")
      expect(MessageManager.all[1].time.to_i).to eq 1_577_836_860
      expect(MessageManager.all[2].content).to include("Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend.")
      expect(MessageManager.all[2].time.to_i).to eq 1_577_836_800
    end
  end
end
