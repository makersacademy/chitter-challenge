describe Peep do
  let(:peep) { described_class.create(time: Time.mktime(1)) }

  describe '#time_ts' do
    it 'shows a human readable time' do
      expect(peep.time_ts).to eq '01 01, 0001, 00:00'
    end
  end
end
