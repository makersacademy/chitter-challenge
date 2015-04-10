describe Blabbs do

  context 'Demonstration of how datamapper works' do

    it 'be created and then retrieved from the db' do
      expect(described_class.count).to eq(0)
      described_class.create(message: 'Sample blabb message here')
      expect(described_class.count).to eq(1)
      blabbs = described_class.first
      expect(blabbs.message).to eq('Sample blabb message here')
      blabbs.destroy
      expect(described_class.count).to eq(0)
    end
  end
end
