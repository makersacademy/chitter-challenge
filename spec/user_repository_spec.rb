require 'user_repository'

RSpec.describe UserRepository do
  before :each do 
    reset_tables
  end

  describe '#all' do
    it 'returns all users' do
      user_repo = UserRepository.new
      all_users = user_repo.all
      expect(all_users.size).to eq 5
      expect(all_users.first.name).to eq 'JarJar Binks'
      expect(all_users.last.name).to eq 'SithLord Binks'
      expect(all_users.last.email).to eq '12BinksJJ@gmail.com'
    end
  end

  describe '#find' do
    it 'returns a user' do
      user_repo = UserRepository.new
      user1 = user_repo.find(1)
      expect(user1.name).to eq 'JarJar Binks'
      user2 = user_repo.find(2)
      expect(user2.email).to eq 'Millenium_Falcon@gmail.com'
    end
  end

  describe '#create' do
    it 'creates a user' do
      user_repo = UserRepository.new
      user = User.new('NewGuy12', 'totally original password', 'Guy New', 'new2email@gmail.com')
      user_repo.create(user)
      expect(user_repo.all.last.password).to eq 'totally original password'
      expect(user_repo.all.last.email).to eq 'new2email@gmail.com'
    end
  end
end