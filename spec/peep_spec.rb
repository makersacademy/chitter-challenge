require 'peep'

describe Peep do
  before(:all) do
    @peeps = []
    peep_objects = Peep.all
    
    peep_objects.each { |peep| @peeps << peep.peep }
  end

  describe '.all' do
    it 'returns all peeps' do
      # peeps = Peep.all

      # expect(peeps.count).to eq 2
      # expect(peeps.first['peep']).to eq '¡Día de partido! ¡Vamos Real, hasta el final!'
      # expect(peeps[1]['peep']).to eq 'El bicho scores a hattrick!'

      expect(@peeps).to match_array ['El bicho scores a hattrick!', '¡Día de partido! ¡Vamos Real, hasta el final!']
    end
  end
end
