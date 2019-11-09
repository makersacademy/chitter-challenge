require 'beet'

describe Beet do
  context '.all' do
    truncate_dbs
    load_beets
    it 'returns all tweets' do
      expect(Beet.all[0].text).to eq("No Brexit!")
    end
  end

  context 'initialize' do
    truncate_dbs
    load_beets
    it "creates a new instance of 'Beet'" do
      beet = Beet.new("I like coding", Time.now)
      expect(beet.text).to eq("I like coding")
    end
  end

  context ".add" do
    truncate_dbs
    load_beets
    it 'adds a beet' do
      Beet.add("Ruby is my shizz")
      expect(Beet.all[-1].text).to include("Ruby is my shizz")
    end
  end

  # context ".edit" do
  #   truncate_dbs
  load_beets
  #   it "edits a beet" do
  #     beet_1 = Beet.add("Ruby is my shizz")
  #     Beet.edit(beet_1["id"], "Javascript is my shizz")
  #   end
  # end
end