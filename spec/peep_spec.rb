require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps.count).to eq 2
      expect(peeps.first['peep']).to eq '¡Día de partido! ¡Vamos Real, hasta el final!'
      expect(peeps[1]['peep']).to eq 'El bicho scores a hattrick!'
    end
  end
end
