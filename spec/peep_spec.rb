require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      p peeps
      expect(peeps).to include '¡Día de partido! ¡Vamos Real, hasta el final!'
      expect(peeps).to include 'El bicho scores a hattrick!'
    end
  end
end
