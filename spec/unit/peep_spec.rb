require 'peep'

describe Peep do 
  describe '.initialize' do
    it 'has an id' do
      described_class.add("Now with passion in our eyes. There's no way we could disguise it secretly", 1)
      expect { described_class.add("Just remember. You're the one thing. I can't get enough of", 1) }.to(change { described_class.all[0].peep_id })
    end

    it 'has peep content' do
      described_class.add("So we take each other's hand. 'Cause we seem to understand the urgency", 1)
      expect(described_class.all[0].peep).to eq "So we take each other's hand. 'Cause we seem to understand the urgency"
    end

    it 'has a user' do
      random_user_no = rand(999_999) # until I have user model just to keep this test passing.
      described_class.add("Just remember. You're the one thing. I can't get enough of", random_user_no)
      expect(described_class.all[0].user).to eq random_user_no.to_s
    end

    it 'has a timestamp' do
      described_class.add("So I'll tell you something. This could be love. Because", 1)
      expect(described_class.all[0].timestamp).not_to be_nil
    end
  end

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
      expect(described_class.all[0].peep).to eq "We saw the writing on the wall. As we felt this magical fantasy"
      expect(described_class.all[1].peep).to eq "I've been waiting for so long. Now I've finally found someone to stand by me"
    end
  end
end
