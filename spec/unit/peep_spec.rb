require 'peep'

describe Peep do

  let!(:peep) { described_class.create(:content => 'Test peep') }

  describe '#content' do
    it 'returns the peep content' do
      expect(peep.content).to eq 'Test peep'
    end
  end
end
