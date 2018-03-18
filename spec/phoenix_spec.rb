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

  describe '.find' do
    it 'returns the phoenix (post) based on the id' do
      result = Phoenix.find(2)
      expect(result.inspect).to include('I completely agree.')
      expect(result.inspect).to include('zantetsuken')
      expect(result.inspect).to include('2018-03-17 17:06:20+00')
    end
  end

  describe '.summon' do
    it 'summons a new phoenix (adds a new post)' do
      Phoenix.summon('Final Fantasy X is awesome', 'tonberry')
      expect(Phoenix.all.inspect).to include('Final Fantasy X is awesome')
      expect(Phoenix.all.inspect).to include('tonberry')
    end
  end

  describe '.reraise' do
    it 'reraises a phoenix (edits a post)' do
      Phoenix.reraise('5', 'This is a phoenix that has been re-raised')
      expect(Phoenix.all.inspect).not_to include('Final Fantasy X is awesome')
      expect(Phoenix.all.inspect).to include('This is a phoenix that has been re-raised')
    end
  end

  describe '.dismiss' do
    it 'dismisses a phoenix (deletes a post)' do
      Phoenix.dismiss('5')
      expect(Phoenix.all.inspect).not_to include('This is a phoenix that has been re-raised')
      expect(Phoenix.all.inspect).not_to include('tonberry')
    end
  end
end
