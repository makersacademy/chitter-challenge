describe 'Chitter' do
  describe '#.peeps' do
    it 'returns a list of peeps' do
      peep = Chitter.create_peep("I'm peeping!")
      Chitter.create_peep("How many peeps could a peeper peep if a peeper could peep peeps?")
      Chitter.create_peep("PEEP!!!")

      peeps = Chitter.peeps

      expect(peeps.length).to eq 3
      expect(peeps.first).to be a Chitter
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "I'm peeping!"
    end
  end

  describe '#.create_peep' do
    it 'creates a peep' do
      peep = Chitter.create_peep("I'm peeping!")

      expect(peep).to be_a Chitter
      expect(peep.peep).to eq "I'm peeping!"

    end
  end
end
