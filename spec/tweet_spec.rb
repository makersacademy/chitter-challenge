describe Tweet do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the database' do
      expect(Tweet.count).to eq(0)
      Tweet.create(user: 'Sebastien',
                  message: 'Hello world, first cloned tweet')
      expect(Tweet.count).to eq(1)
      tweet = Tweet.first
      expect(tweet.message).to eq('Hello world, first cloned tweet')
      expect(tweet.user).to eq('Sebastien')
      tweet.destroy
      expect(Tweet.count).to eq(0)
    end

  end

end