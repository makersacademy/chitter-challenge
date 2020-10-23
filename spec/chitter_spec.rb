require_relative '../lib/chitter.rb'
describe ChitterManager do
  describe '.all' do
    it 'returns all the peeps' do
      #set up to add peep to db
      expect(ChitterManager.all).to include('I ran 8 miles today, #winning')    
    end
  end
end

#create test database, database set up helper, update db migrations