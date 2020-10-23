require_relative '../lib/chitter.rb'
describe Chitter do
  describe '.all' do
    it 'returns all the peeps' do
      #set up to add peep to db
      expect(Chitter.all).to include('I ran 8 miles today, #winning')    
    end
  end
end

#create test database, database set up helper, update db migrations