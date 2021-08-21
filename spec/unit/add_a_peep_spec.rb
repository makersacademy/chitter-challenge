require 'peep'

describe Peep do

  let (:peep) { described_class.new }
  let (:new_peep) { "Im a brand new peep" }

  describe '#create' do
    it 'creates a new peep' do
      expect(peep.create(new_peep)).to be_a(Peep)
    end
  end

end
