describe Peep do
  let(:time_class) {double(:time_class)}

  describe '#time' do

    it 'returns the time of creation' do
      allow(time_class).to receive_message_chain(:now, :strftime).and_return "12:00"
      expect(Peep.create(time_class: time_class).time).to eq '12:00'
    end
  end
end
