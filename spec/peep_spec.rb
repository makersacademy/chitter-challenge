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
end
