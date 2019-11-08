require 'beet'

describe Beet do
  context '.all' do
    truncate_and_load_beets
    it 'returns all tweets' do
      expect(Beet.all).to include("I hate SJWs!")
    end
  end
end