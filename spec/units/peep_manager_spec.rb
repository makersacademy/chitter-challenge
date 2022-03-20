require 'peep_manager'

describe PeepManager do
  subject(:peep_manager) { described_class.new }
  
  describe '#add' do
    it 'adds a new peep to the database' do
      expect { peep_manager.add('new peep content') }.to change { peep_manager.peep_count }.by 1
    end
  end

  describe '#all_peeps' do
    it 'returns an array of the current peeps' do
      fresh_manager = described_class.new
      peep1 = 'Content of Peep 1'
      fresh_manager.add(peep1)
      expect(fresh_manager.all_peeps).to eq [peep1]
    end
  end
end