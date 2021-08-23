require_relative '../../lib/tweet'

describe Tweet do
  let(:tweets) { Tweet.all }

  describe '#initialize' do
    it 'should initialize with two attributes' do
      tweet = Tweet.new(id: 1, tweet: 'example', time: nil, date: nil)
      expect(tweet).to have_attributes(id: 1, tweet: 'example')
    end
  end

  describe '#self.all' do
    it 'returns posted tweets' do
      post_test_tweets
      expect([tweets[0].id, tweets[0].tweet]).to eq(['1', 'test tweet 1'])
      expect([tweets[1].id, tweets[1].tweet]).to eq(['2', 'test tweet 2'])
      expect([tweets[2].id, tweets[2].tweet]).to eq(['3', 'test tweet 3'])
    end
  end

  describe '#self.post' do
    it 'should post tweet' do
      Tweet.post(tweet: 'example')
      expect(tweets[0].id).to eq '1'
      expect(tweets[0].tweet).to eq 'example'
    end
  end
end
