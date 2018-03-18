require 'summoner'

describe Summoner do

  describe '.create' do
    it 'gives birth to a new summoner' do
      summoner = Summoner.create('julesnuggy', 'julesnuggy@gmail.com', 'julesisamazing')
      expect(Summoner.all.inspect).to include('julesnuggy')
      expect(Summoner.all.inspect).to include('julesnuggy@gmail.com')
    end
  end

  describe '.find' do
    it 'returns the summoner object searched for by username' do
      summoner = Summoner.create('yuna', 'yuna@gmail.com', 'yunaisamazing')
      expect(Summoner.find(6).inspect).to include('yuna')
    end
  end

end
