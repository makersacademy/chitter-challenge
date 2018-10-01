describe Peep do
  Timecop.freeze(Time.new(2018, 9, 20, 15, 0, 0, 0))
  describe '.all' do
    it 'returns empty array on creation' do
      expect(Peep.all).to be_empty
    end
  end

  describe '.add' do
    context 'message is empty' do
      it 'nothing happens' do
        Peep.add(" ")
        expect(Peep.all).to eq([])
      end
    end

    context 'message is not empty' do
      let(:a) { Peep.add("hello") }
      let(:b) { Peep.add("goodbye") }

      it 'takes a message argument and saves to instance in .all' do
        expect(Peep.all).to eq([a, b])
      end

      it 'instance sets date to Time.now' do
        expect(a.time).to eq(Time.parse("2018-09-20T15:00:00+00:00"))
      end

      it 'instance sets text to argument' do
        expect(a.text).to eq("hello")
      end
    end
  end

  describe 'time_format' do
    let(:a) { Peep.add("hello") }
    it 'returns user-friendly format for DateTime' do
      expect(a.time_format).to eq("Posted at 20-09-18 15:00")
    end
  end

  describe '.add_sorted' do
    it 'returns arrays in reverse order' do
      a = Peep.add("1")
      b = Peep.add("2")
      c = Peep.add("3")
      expect(Peep.all_sorted).to eq([c, b, a])
    end
  end
end
