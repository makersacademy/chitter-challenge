require 'peep'

describe Peep do

  let(:peep) { Peep.create(
    :peeptext => "This is a test peep.",
    :timestamp => Time.new) }

  describe '#create' do
    it 'returns a Peep' do
      expect(peep).to be_a Peep
    end

    it 'puts the new data in the database' do #Is this the right way to test database functionality?
      expect(peep.peeptext).to eq 'This is a test peep.'
      expect(peep.maker_id).to eq nil
    end
  end

end
