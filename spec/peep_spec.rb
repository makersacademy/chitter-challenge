describe 'Chitter' do
  describe '#.peeps' do
    it 'returns a list of peeps' do
      peep = Peep.create_peep(peep: "Im peeping!")
      Peep.create_peep(peep: "How many peeps could a peeper peep if a peeper could peep peeps?")
      Peep.create_peep(peep: "PEEP!!!")

      peeps = Peep.peeps
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "Im peeping!"
    end
  end

  describe '#.create_peep' do
    it 'creates a peep' do
      peep = Peep.create_peep(peep: "Im peeping!")

      expect(peep).to be_a Peep
      expect(peep.peep).to eq "Im peeping!"

    end
  end
end
