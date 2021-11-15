require 'chitter'

describe Chitter do
  
  describe '.all' do
    it 'returns a feed of tweet' do  

      Chitter.create("My first post")
      Chitter.create("And a follow up")
  
      chitters = Chitter.all
      expect(chitters.count).to eq(2)
      expect(chitters[0]).to be_a Chitter
      expect(chitters[0].tweet).to eq('My first post')
      expect(chitters[1].tweet).to eq('And a follow up')
    end
  end

  describe '.create' do # Discuss with pair
    it 'creates a new chitter post' do
      Chitter.create("My first post")
      chitters = Chitter.all
      expect(chitters[0].date).to eq(Date.today.to_s)
      expect(chitters[0].tweet).to eq('My first post')
    end
  end
end