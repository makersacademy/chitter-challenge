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
    it "tweet has a username if logged in" do
      add_test_cheets_with_user
      cheets = Cheet.all
      expect(cheets.first.user).to eq('User1')
    end
  end
  context 'creating cheets' do
    it 'adds a cheet to the db' do
      Cheet.create("Another cheet", 'Alfie')
      cheets = Cheet.all
      expect(cheets.first.cheet).to include "Another cheet"
    end
  end
end
