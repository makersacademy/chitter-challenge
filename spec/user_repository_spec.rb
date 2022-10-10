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

  describe '#login?' do
    it 'returns true when user is in database' do
      returning_user = User.new("Heisenberg", 'roof_pizza')
      user_repo = UserRepository.new
      expect(user_repo.login? returning_user).to eq true
      other_user = User.new('Ken_Benobi', 'hello_there!')
      expect(user_repo.login? other_user).to eq true
    end

    it 'returns false when user is not in database' do
      non_user = User.new('JessePinkman', 'Yeah Science!')
      user_repo = UserRepository.new
      expect(user_repo.login?(non_user)).to eq false
      other_user = User.new('Keb_Bebobi', 'hello_there!')
      expect(user_repo.login?(other_user)).to eq false
    end
  end

  describe '#get_user_id' do
    it 'Returns the index from DB when given username' do
      user_repo = UserRepository.new
      expect(user_repo.get_user_id("JarJarSecond")).to eq "5"
      expect(user_repo.get_user_id("Heisenberg")).to eq '4'
    end
  end
end