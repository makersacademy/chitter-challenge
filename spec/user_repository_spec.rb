require 'user'
require 'user_repository'

def reset_peeps_users_tables
  seed_sql = File.read('schema/peeps_users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before do 
    reset_peeps_users_tables
    @repo = UserRepository.new
  end

  xit 'gets all users' do

    users = @repo.all_users

    expect(users.length).to eq 4

    expect(users[0].id).to eq '1'
    expect(users[0].email).to eq 'samuelbadru@outlook.com'
    expect(users[0].password).to eq 'makersforlife'
    expect(users[0].name).to eq 'Samuel Badru'
    expect(users[0].username).to eq'sobad'

    expect(users[1].id).to eq '2'
    expect(users[1].email).to eq 'jermainecole@hotmail.com'
    expect(users[1].password).to eq 'middlechild'
    expect(users[1].name).to eq 'Jermaine Cole'
    expect(users[1].username).to eq 'j.cole'
  end

  context "get a single user" do
      xit 'uses the correct email and password' do
        user = @repo.find_user('aubreygraham@gmail.com', 'hotlinebling')

        expect(user.id).to eq '3'
        expect(user.email).to eq 'aubreygraham@gmail.com'
        expect(user.password).to eq 'hotlinebling'
        expect(user.name).to eq 'Aubrey Graham'
        expect(user.username).to eq 'drake'
      end

      xit 'uses the correct username and password' do
        user = @repo.find_user('kendricklamar', 'goodkid')

        expect(user.id).to eq '4'
        expect(user.email).to eq 'kendrickduckworth@aol.com'
        expect(user.password).to eq 'goodkid'
        expect(user.name).to eq 'Kendrick Duckworth'
        expect(user.username).to eq 'kendricklamar'
      end
  end

  context 'create a user' do
    xit 'uses an available username and email' do
      new_user = User.new
      expect(new_user.email).to eq 'santandave@icloud.com'
      expect(new_user.password).to eq 'psychodrama'
      expect(new_user.name).to eq  'Santan Dave'
      expect(new_user.username).to eq  'dave'

      expect(@repo.create_user(new_user)).to eq true
      users = @repo.all_users
      expect(users[-1].email).to eq 'santandave@icloud.com'
      expect(users[-1].password).to eq 'psychodrama'
      expect(users[-1].name).to eq  'Santan Dave'
      expect(users[-1].username).to eq  'dave'
    end

    xit 'uses unavailable username' do
      new_user = User.new
      expect(new_user.email).to eq 'drakebell@icloud.com'
      expect(new_user.password).to eq 'drakeandjosh'
      expect(new_user.name).to eq  'Drake Bell'
      expect(new_user.username).to eq  'drake'

      expect(@repo.create_user(new_user)).to eq false
    end

    xit 'uses unavailable email' do
      new_user = User.new
      expect(new_user.email).to eq 'samuelbadru@outlook.com'
      expect(new_user.password).to eq 'drakeandjosh'
      expect(new_user.name).to eq  'Drake Bell'
      expect(new_user.username).to eq  'drakejosh'

      expect(@repo.create_user(new_user)).to eq false
    end
  end
end