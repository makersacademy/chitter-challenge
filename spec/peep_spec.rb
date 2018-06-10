describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peep_1 = Peep.create(content: "Frirst peep")
      peep_2 = Peep.create(content: "Second peep")
      peep_3 = Peep.create(content: "Third peep")

      expected_peeps= [
        peep_1,
        peep_2,
        peep_3
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

  describe '#==' do
    it 'two bookmarks are equal if their ids match' do
      peep_1 = Peep.new(1, content: 'Test peep')
      peep_2 = Peep.new(1, content: 'Test peep')

      expect(peep_1).to eq (peep_2)
    end
  end
end
