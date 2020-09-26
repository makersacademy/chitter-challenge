require 'chitter'

describe '#add' do
  it 'adds a tweet' do
    tweet = Chitter.add(tweet:"What!?", date:"2020-09-09")
    expect(tweet.tweet).to eq("What!?")
  end
end
describe '#show' do
  it 'returns a list of tweets' do
    tweet = Chitter.add(tweet:"What!?", date:"2020-09-09")
    expect(tweet.tweet).to include("What!?")
  end
end
