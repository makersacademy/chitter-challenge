require 'spec_helper'

describe Tweet do
  context 'Demonstration of how datamapper works' do
    it 'can be created and then retrieved from the database' do
      expect(described_class.count).to eq(0)
      described_class.create(user: 'Sammy',
                             message: 'Hello world, first tweet')
      expect(described_class.count).to eq(1)
      tweet = described_class.first
      expect(tweet.message).to eq('Hello world, first tweet')
      expect(tweet.user).to eq('Sammy')
      tweet.destroy
      expect(described_class.count).to eq(0)
    end
  end
end
