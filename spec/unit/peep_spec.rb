require 'peep'

describe Peep do 
  describe '#self.add' do
    it 'allows user to add a peep' do
      expect(described_class).to respond_to(:add).with(2).arguments
    end
  end

  describe '#self.all' do
    it 'returns all peeps in reverse chronological order' do
      expect(described_class).to respond_to(:all).with(0).arguments
      described_class.add("I've been waiting for so long. Now I've finally found someone to stand by me", 1)
      described_class.add("We saw the writing on the wall. As we felt this magical fantasy", 1)
      p described_class.all
      expect(described_class.all[0].peep).to eq "We saw the writing on the wall. As we felt this magical fantasy"
      expect(described_class.all[1].peep).to eq "I've been waiting for so long. Now I've finally found someone to stand by me"
    end
  end
end
