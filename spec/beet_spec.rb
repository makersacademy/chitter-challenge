require 'beet'

describe Beet do
  context '.all' do
    truncate_and_load_beets
    it 'returns all tweets' do
      expect(Beet.all).to include("SJWs make me sick!")
    end

    context ".add" do
      truncate_and_load_beets
      it 'adds a beet' do
        Beet.add("Ruby is my shizz")
        expect(Beet.all).to include("Ruby is my shizz")
      end
    end
  end
end