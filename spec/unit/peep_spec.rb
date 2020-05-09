require 'peep'

describe Peep do
  describe '#all' do
    it 'shows the peep and time of peep' do
      first_peep = Peep.add(peep: 'Good morning!')
      Peep.add(peep: 'This is a peep!')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.time).to include first_peep.time
      expect(peeps.first.peep).to eq 'Good morning!'
    end
  end

  describe '#add' do
    it 'adds peeps to the database' do
      first_peep = Peep.add(peep: 'Good morning!')
      Peep.add(peep: 'This is a peep!')
      Peep.add(peep: "A lovely sunny friday")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.time).to include first_peep.time
      expect(peeps.first.id).to eq first_peep.id
      expect(peeps.first.peep).to eq first_peep.peep

    end
  end
end
