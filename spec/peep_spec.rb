describe Peep do
  let(:printer) { double(:printer, print_out_peeps: nil) }
  let(:printer_class) { double(:printer_class, new: printer) }
  let(:user) { double(:user, check_user: nil) }
  let(:new_peep) { Peep.create(content: 'Hello world') }
  describe '#create' do
    it 'can be created with a content paramater' do
      expect(new_peep.content).to eq "Hello world"
    end
  end

  describe '#print_peeps' do
    it 'sends list of peeps to printer class' do
      new_peep
      all_peeps = Peep.all
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
  describe '#self.check_tags' do
    context 'peep with one potential tag' do
      it 'sends tag and content to user class to validate' do
        tagged_peep = Peep.create(content: 'hello @tomd')
        expect(user).to receive(:check_users).with(tags: ['tomd'], peep: tagged_peep)
        Peep.check_tags(tagged_peep, user)
      end
    end
    context 'peep with more than one potential tag' do
      it 'sends all tags to user class' do
        multi_tagged_peep = Peep.create(content: 'hello @tomd and @james')
        expect(user).to receive(:check_users).with(tags: ['tomd', 'james'], peep: multi_tagged_peep)
        Peep.check_tags(multi_tagged_peep, user)
      end
    end
    context 'peep with no tags' do
      it 'returns nil' do
        no_tags = Peep.create(content: 'hello world')
        expect(Peep.check_tags(no_tags)).to eq nil
      end
    end
  end
end
