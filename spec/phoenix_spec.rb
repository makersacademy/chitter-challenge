require 'phoenix'

describe Phoenix do

  before do
  end

  describe '.all' do
    it 'returns the entire "summons" table with the phoenixes (posts)' do
      results = Phoenix.all
      expect(results.inspect).to include('OMG Final Fantasy is the best!')
      expect(results.inspect).to include('I completely agree.')
      expect(results.inspect).to include('You guys sound like awesome people!')
    end

    it 'returns the entire "summons" table with the summoners (usernames)' do
      results = Phoenix.all
      expect(results.inspect).to include('julesnuggy')
      expect(results.inspect).to include('zantetsuken')
      expect(results.inspect).to include('renzokuken')
    end

    it 'returns the entire "summons" table with the timestamp' do
      results = Phoenix.all
      expect(results.inspect).to include('2018-03-17 17:00:00+00')
      expect(results.inspect).to include('2018-03-17 17:06:20+00')
      expect(results.inspect).to include('2018-03-17 17:30:09+00')
    end
  end

  describe '.summon' do
    it 'summons a new phoenix (adds a new post)' do
      Phoenix.summon('Final Fantasy X is awesome', 'tonberry')
      expect(Phoenix.all.inspect).to include('Final Fantasy X is awesome')
      expect(Phoenix.all.inspect).to include('tonberry')
    end
  end

end
