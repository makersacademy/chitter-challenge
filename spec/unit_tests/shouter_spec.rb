require 'shouter'
require 'timecop'

describe Shouter do
  before do
    Timecop.freeze
  end
  describe '.shout' do
    it 'stores a shout into the shout database table' do
      Shouter.setup
      expect(Shouter.shout('This is my first shout', 'Solo').first["shout_content"]).to eq 'This is my first shout'
    end
  end

  describe '.setup' do
    it 'setups up the database connection' do
      expect(Shouter.setup.db).to eq 'shouter_database_test'
    end
  end

  describe '.all' do
    it 'returns all the shouts from the database as an array with ' do
      Shouter.setup
      Shouter.shout('This is my first shout', 'Solo')
      Shouter.shout('This is my second shout', 'Solo')
      expect(Shouter.all).to be_an Array
      expect(Shouter.all[0]['shout_content']).to include 'This is my second shout'
      expect(Shouter.all[1]['shout_content']).to include 'This is my first shout'
    end
  end

  describe '.find' do
    it 'returns the shout based on shout_id' do
      Shouter.setup
      Shouter.shout('This is my first shout', 'Solo')
      expect(Shouter.find(1).first['shout_content']).to eq 'This is my first shout'
    end
  end

  describe '.reply' do
    it 'adds a reply to a shout' do
      Shouter.setup
      Shouter.shout('This is my first shout', 'Solo')
      expect(Shouter.reply('This is my first reply', '1', 'Solo').first["reply_content"]).to eq 'This is my first reply'
    end
  end

  describe '.replies' do
    it 'finds all replies related to a shout' do
      Shouter.setup
      Shouter.shout('This is my first shout', 'Solo')
      Shouter.reply('This is my first reply', '1', 'Solo')
      expect(Shouter.replies('1').first['reply_content']).to eq 'This is my first reply'
    end
  end
end
