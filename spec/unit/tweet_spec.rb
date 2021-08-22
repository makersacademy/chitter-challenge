require_relative '../../lib/twitter_clone.rb'

describe Tweet do
  describe '#initialize' do
    it 'should initialize with two attributes' do
      tweet = Tweet.new(id: 1, tweet: 'example')
      expect(tweet).to have_attributes(id: 1, tweet: 'example')
    end
  end

  describe '#self.all' do
    xit 'returns posted tweets' do
      
    end
  end
end