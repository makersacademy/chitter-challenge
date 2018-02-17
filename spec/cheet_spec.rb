require 'cheet'

describe Cheet do
  describe '::add_cheet' do
    it 'adds a new cheet' do
    cheet = described_class.add_cheet('My cheet','Body of text')
    expect(described_class.all).to include cheet
    end
  end

  describe '::reverse_chronological_cheets' do
    it 'orders cheets' do
      cheets = Cheet.reverse_chronological_cheets
      cheet_1_time = cheets[0].created_at
      cheet_2_time = cheets[1].created_at
      cheet_3_time = cheets[2].created_at
      expect(cheet_1_time).to be > cheet_2_time
      expect(cheet_2_time).to be > cheet_3_time
    end
  end
end
