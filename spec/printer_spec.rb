describe Printer do
  before do
    time_now = Time.now
    Timecop.freeze(time_now)
  end
  let(:formatted_time) { Time.now.strftime("%m/%d/%Y %H:%M") }
  let(:user) {double(:user, username: "tomd")}
  let(:user_class) {double(:user_class, get: user)}
  let(:peep1) { double(:peep1, content: "First content", created_at: Time.now, user_id: 1) }
  let(:peep2) { double(:peep2, content: "Second content", created_at: Time.now, user_id: 2) }
  let(:peeps) { [peep1, peep2] }
  describe '#print_out_peep' do
    it "formats peeps to be printed, in reverse order" do
      expect(subject.print_out_peeps(peeps, user_class)).to eq ["Second content - tomd, #{formatted_time}", "First content - tomd, #{formatted_time}"]
    end
  end
end
