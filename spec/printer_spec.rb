describe Printer do
  before do
    time_now = Time.now
    Timecop.freeze(time_now)
  end
  let(:formatted_time) { Time.now.strftime("%m/%d/%Y %H:%M") }
  let(:peep1) { double(:peep1, content: "First content", created_at: Time.now) }
  let(:peep2) { double(:peep2, content: "Second content", created_at: Time.now) }
  let(:peeps) { [peep1, peep2] }
  describe '#print_out_peep' do
    it "formats peeps to be printed, in reverse order" do
      expect(subject.print_out_peeps(peeps)).to eq ["Second content, #{formatted_time}", "First content, #{formatted_time}"]
    end
  end
end
