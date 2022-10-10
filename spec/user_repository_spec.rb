require 'user_repository'
require 'database_connection'

def reset_users_table
  seed_sql = File.read('spec/user_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'gets all users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 2
    expect(users[0].email).to eq 'name@email.com'
    expect(users[0].password).to eq 'Password1'
    expect(users[1].email).to eq 'name_surname@email.com'
    expect(users[1].password).to eq 'password_2'
  end
  
    xit 'finds a peep' do
      repo = PeepRepository.new
      peep = repo.find(2)
      expect(peep.message).to eq 'Love this song!'
      expect(peep.tag).to eq 'Miles'
      expect(peep.created_at).to eq '2001-01-14 08:45:00'
    end

    xit 'creates a new peep' do
      repo = PeepRepository.new
      new_peep = Peep.new
      new_peep.message = 'Hello, world!'
      new_peep.tag = ''
      new_peep.created_at = '2022-01-01 12:00'
      repo.create(new_peep)

      peeps = repo.all
      last_peep = peeps.last
      expect(last_peep.message).to eq 'Hello, world!'
      expect(last_peep.tag).to eq ''
      expect(last_peep.created_at).to eq '2022-01-01 12:00:00'
  end
end