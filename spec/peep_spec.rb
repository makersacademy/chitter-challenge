require 'peep'

describe 'Peep' do
  context '.create' do
    it 'returns a peep' do
      PEEP = 'I am happy'
      peep = Peep.create(peep: PEEP)
      peep_saved = get_peep_by_id(id: peep.id)
      expect(peep.peep).to eq PEEP
      expect(peep.peep).to eq peep_saved['peep']
      expect(peep.date).to eq peep_saved['date']
    end
  end

  context '.all' do
    it 'returns a list of peeps' do
      peep1 = Peep.create(peep: 'I am happy')
      peep2 = Peep.create(peep: 'I am sad')
      peep3 = Peep.create(peep: 'I am hungry')
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0].peep).to eq peep1.peep
      expect(peeps[1].peep).to eq peep2.peep
      expect(peeps[2].peep).to eq peep3.peep
    end
  end
end
