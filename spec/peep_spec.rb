describe Peep do
  describe '.all' do
    it 'returns all the peeps in reverse order' do
      peep_1 = Peep.create(content: "Frirst peep")
      peep_2 = Peep.create(content: "Second peep")
      peep_3 = Peep.create(content: "Third peep")

      expected_peeps = [
        peep_3,
        peep_2,
        peep_1
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'This is my first peep')
      expect(Peep.all).to include peep
    end
  end

  # describe '.time' do
  #   it 'returns a string holding the current time' do
  #     fake_time = double :time
  #     allow(fake_time).to receive(:now).and_return("test time")
  #     peep = Peep.new(1, "content", fake_time)
  #     expect(Peep.time).to eq "test_time"
  #   end
  # end

  describe '#==' do
    it 'two bookmarks are equal if their ids match' do
      peep_1 = Peep.new(1, 'Test peep', timestamp: '10-06-18 17:12')
      peep_2 = Peep.new(1, 'Test peep', timestamp: '10-06-18 17:12')

      expect(peep_1).to eq peep_2
    end
  end
end
