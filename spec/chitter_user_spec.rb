require './lib/chitter_user.rb'

describe ChitterUser do
  describe '#add' do
    it 'adds a user to the database' do
      drop_test_database
      user = ChitterUser.add(email: 'test@testhere.com', username: 'Test1',
        name: 'Test One', password: 'Password123')
      expect(user.username).to eq 'Test1'
    end
  end
end
