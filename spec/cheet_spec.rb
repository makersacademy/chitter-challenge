require 'cheet'

describe Cheet do
  context 'displaying cheets' do
    it 'returns a list of cheets' do
      add_test_cheets
      cheets = Cheet.all
      expect(cheets.first.cheet).to include "My first cheet"
    end
    it 'has a timestamp' do
      add_test_cheets
      cheets = Cheet.all
      expect(cheets.first).to respond_to(:timestamp)
    end
    it "has a default username of 'Anonymous'" do
      add_test_cheets
      cheets = Cheet.all
      expect(cheets.first.user).to eq('Anonymous')
    end
  end
  context 'creating tweets' do
    it 'adds a cheet to the db' do
      Cheet.create("Another cheet")
      cheets = Cheet.all
      expect(cheets.first.cheet).to include "Another cheet"
    end
  end
end
