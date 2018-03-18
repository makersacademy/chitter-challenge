require 'summoner'

describe Summoner do

  describe '.create' do
    it 'gives birth to a new summoner' do
      summoner = Summoner.create('julesnuggy', 'julesnuggy@gmail.com')
      expect(summoner.username).to eq 'julesnuggy'
      expect(summoner.email).to eq 'julesnuggy@gmail.com'
    end
  end

  describe '.find' do
    it 'returns the summoner object searched for by username' do
      ren = Summoner.create('renzokuken', 'ren@gmail.com')
      zan = Summoner.create('zantetsuken', 'zan@gmail.com')
      expect(Summoner.find('renzokuken')).to include(ren)
      expect(Summoner.find('zantetsuken')).to include(zan)
    end
  end

end
