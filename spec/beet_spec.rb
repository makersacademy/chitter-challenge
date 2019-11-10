require 'beet'

describe Beet do
  context '.new' do
    truncate_dbs
    load_beets
    beet = Beet.new('Bitterness all around!', Time.now, 'mrJones')

    it 'has text' do
      expect(beet.text).to eq('Bitterness all around!')
    end

    it 'has a user' do
      expect(beet.user).to eq('mrJones')
    end

    it 'has a timestamp' do
      expect(beet.timestamp).to be_a(Time)
    end
  end

  context '.all' do
    truncate_dbs
    load_beets
    it 'returns all beets' do
      expect(Beet.all[0].text).to eq("No Brexit!")
    end
  end

  context ".add" do
    truncate_dbs
    load_beets
    it 'adds a beet' do
      Beet.add("Ruby is my shizz", "mrJones")
      expect(Beet.all[-1].text).to eq("Ruby is my shizz")
      expect(Beet.all[-1].user).to eq("mrJones")
    end
  end
end