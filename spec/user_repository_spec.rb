require 'user_repository'

RSpec.describe UserRepository do
  describe 'all' do
    it 'Creates array of all users' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq 3

      expect(users[0].id).to eq 1
      expect(users[0].username).to eq 'ted453'
      expect(users[0].name).to eq 'Ted D'
      expect(users[0].email).to eq 'tedd@hotmailtest.com'
      expect(users[0].password).to eq 'qwerty123'

      expect(users[1].id).to eq 2
      expect(users[1].name).to eq 'Jemm Platz'
      expect(users[1].email).to eq 'JSpace@yahoot.com'
    end
  end
  describe 'find' do
    it 'returns the user object for id 1' do
      repo = UserRepository.new

      user = repo.find(1)
      expect(user.id).to eq 1
      expect(user.username).to eq 'ted453'
      expect(user.name).to eq 'Ted D'
      expect(user.email).to eq 'tedd@hotmailtest.com'
      expect(user.password).to eq'qwerty123'
    end
    it 'returns the user object for id 3' do
      repo = UserRepository.new

      user = repo.find(3)

      expect(user.id).to eq 3
      expect(user.username).to eq 'user123'
      expect(user.name).to eq 'Anon Ymouse'
      expect(user.email).to eq 'is_a_user@user.com'
      expect(user.password).to eq'password_123'
    end
  end
end
