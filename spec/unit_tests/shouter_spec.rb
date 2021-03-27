require 'shouter'
require 'timecop'

describe Shouter do
  before do
    Timecop.freeze
  end
  describe '.shout' do
    it 'stores a shout into the shout database table' do
      Shouter.setup
      expect(Shouter.shout('This is my first shout').first).to eq ['Solo',Time.now,'This is my first shout']
    end
  end

  describe '.setup' do
    it 'setups up the database connection' do
      expect(Shouter.setup).to eq []
    end
  end

  describe '.all' do
    it 'returns all the shouts from the database' do
      Shouter.setup
      Shouter.shout('This is my first shout')
      Shouter.shout('This is my second shout')
      expect(Shouter.all).to eq [['Solo',Time.now,'This is my first shout'],['Solo',Time.now,'This is my second shout']]
    end
  end
end
