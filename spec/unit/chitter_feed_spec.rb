require 'chitter_feed'

describe ChitterFeed do 
  
  describe '.all' do 
    it 'returns all the messages in the feed' do 
        feed = ChitterFeed.all

        expect(feed).to include("Hello World")
        expect(feed).to include("Hello Chitter")
    end
  end


end


