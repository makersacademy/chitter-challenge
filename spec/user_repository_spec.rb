require 'user_repository'

RSpec.describe UserRepository do
  describe 'all' do
    it 'Creates array of all users' do
      repo = userRepository.new
      users = repo.all

      expect(users.length).to eq 3

      expect(users[0].id).to eq 1
      expect(users[0].username).to eq 'ted453'
      expect(users[0].name).to eq 'Ted D'
      expect(users[0].email).to eq 'tedd@hotmailtest.com'
      expect(users[0].password).to eq 'qwerty123'

      expect(users[1].id).to eq 2
      expect(users[1].name).to eq 'Anna'
      expect(users[1].email).to eq 'May 2022'
    end
  end


end