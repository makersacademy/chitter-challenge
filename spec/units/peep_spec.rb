describe Peep do

  let(:content) { 'Peep peep' }
  let(:time_stamp) { Time.new(2021, 01, 31, 15, 00, 00) }

  describe '.all' do
    it 'lists Peep objects with content in them' do
      new_peep = described_class.new_peep(content, time_stamp)
      id = new_peep.id
      peeps = described_class.all
      expect(peeps).to all(be_an_instance_of(Peep))
      expect(peeps.first.id).to eq id
      expect(peeps.first.content).to eq content
    end
  end

  describe '.new_peep' do
    let(:new_peep) { described_class.new_peep(content, time_stamp) }
    let(:id) { new_peep.id }
    let(:added_data) { persisted_data(id: id, table: 'peep').first }

    it 'returns a peep object' do
      expect(new_peep).to be_an_instance_of(Peep)
    end

    it 'adds the peep to the peeps table' do
      expect(id).to eq added_data['id'].to_i
    end

    it 'has the right content' do
      expect(new_peep.content).to eq content
    end

    it 'has a time stamp for when it was posted' do
      expect(new_peep.posted_time_stamp).to eq time_stamp
    end

  end

end
