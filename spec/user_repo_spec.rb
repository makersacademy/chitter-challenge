require 'user_repo'
require 'user'

def reset_table
  seed_sql = File.read('spec/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepo do
  before(:all) do
    reset_table
    @repo = UserRepo.new
  end
  after(:all) { reset_table }

  context 'runs the .all method' do
    it 'returns all users' do
      expect(@repo.all.length).to eq(2)
      expect(@repo.all[0].name).to eq('Anonymous')
      expect(@repo.all[0].username).to eq('Anon')
    end
  end

  context 'runs the .create method' do
    it 'adds a user to the database' do
      user = User.new
      user.name = 'test'
      user.username = 'test'
      user.email = 'test'
      user.password = 'test'
      @repo.create(user)
      expect(@repo.all.length).to eq(3)
      expect(@repo.all.last.name).to eq('test')
    end
  end

  context 'runs the .delete method' do
    it 'deletes a user from the database' do
      @repo.delete(3)
      expect(@repo.all.length).to eq(2)
    end
  end

  context 'runs the .login method' do
    it 'changes logged_in to true' do
      @repo.login(1)
      expect(@repo.all[0].logged_in).to eq('t')
      expect(@repo.all[1].logged_in).to eq('t')
    end
  end

  context 'runs the .logout method' do
    it 'changes logged_in to false' do
      @repo.logout(2)
      expect(@repo.all[0].logged_in).to eq('t')
      expect(@repo.all[1].logged_in).to eq('f')
    end
  end

  context 'runs the .logout method' do
    it 'changes logged_in to false' do
      @repo.logout(1)
      expect(@repo.all[0].logged_in).to eq('f')
      expect(@repo.all[1].logged_in).to eq('f')
    end
  end
end
