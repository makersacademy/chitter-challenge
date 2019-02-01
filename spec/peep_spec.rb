describe Peep do
  let(:printer) { double(:printer, print_out_peeps: nil) }
  let(:printer_class) { double(:printer_class, new: printer) }
  let(:new_peep) { Peep.create(content: 'Hello world') }
  describe '#create' do
    it 'can be created with a content paramater' do
      expect(new_peep.content).to eq "Hello world"
    end
  end

  describe '#all_peeps' do
    it 'returns array of Peep instances' do
      new_peep
      expect(Peep.all_peeps[0]).to be_a(Peep)
    end

    it "returns peeps with content paramaters" do
      new_peep
      expect(Peep.all_peeps[0].content).to eq "Hello world"
    end
  end

  describe '#print_peeps' do
    it 'sends list of peeps to printer class' do
      new_peep
      all_peeps = Peep.all_peeps
      expect(printer).to receive(:print_out_peeps).with(all_peeps)
      Peep.print_peeps(printer_class)
    end
  end

  describe '#created_at' do
    before do
      time_now = Time.now
      Timecop.freeze(time_now)
    end
    it "returns time the peep was created" do
      expect(new_peep.created_at).to eq DateTime.now
    end
  end
end
