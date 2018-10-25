require 'cheet'

describe Cheet do
  context 'displaying cheets' do
    it 'returns a list of cheets' do
      add_test_cheets
      cheets = Cheet.all
      expect(cheets.first.cheet).to include "My first cheet"
    end
  end
  context 'creating tweets' do

  end
end
