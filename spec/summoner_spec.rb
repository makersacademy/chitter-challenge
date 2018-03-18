require 'summoner'

describe Summoner do

  describe '.create' do
    it 'gives birth to a new summoner' do
      summoner = Summoner.create('julesnuggy', 'julesnuggy@gmail.com', 'julesisamazing')
      expect(Summoner.all.inspect).to include('julesnuggy')
      expect(Summoner.all.inspect).to include('julesnuggy@gmail.com')
    end

    it 'encrypts the password' do
      expect(BCrypt::Password).to receive(:create).with('julesisamazing')
      Summoner.create('julesnuggy', 'julesnuggy@gmail.com', 'julesisamazing')
    end
  end

  describe '.find' do
    it 'returns the summoner object searched for by username' do
      summoner = Summoner.create('yuna', 'yuna@gmail.com', 'yunaisamazing')
      expect(Summoner.find(summoner.user_id).username).to eq('yuna')
    end
  end

end
