describe Peep do

  let(:content) { 'Peep peep' }

  describe '.all' do
    it 'lists Peep objects with content in them' do
      new_peep = described_class.new_peep(content)
      id = new_peep.id
      peeps = described_class.all
      expect(peeps).to all(be_an_instance_of(Peep))
      expect(peeps.first.id).to eq id
      expect(peeps.first.content).to eq content
    end
  end

  describe '.new_peep' do
    let(:new_peep) { described_class.new_peep(content) }
    it 'returns a peep object' do
      expect(new_peep).to be_an_instance_of(Peep)
    end
    it 'adds the peep to the peeps table' do
      id = new_peep.id
      persisted_data = persisted_data(id: id, table: 'peep').first
      expect(id).to eq persisted_data['id'].to_i
      expect(new_peep.content).to eq persisted_data['content']
    end
  end

end
