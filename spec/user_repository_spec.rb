require 'user_repository'
require 'user'

describe UserRepository do

def reset_chitter_tables
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end


  before(:each) do 
    reset_chitter_tables
  end

  it 'returns list of all users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 2
    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'Ricki Tarr'
    expect(users[0].username).to eq 'scalphunter'
    expect(users[0].email).to eq 'RickiTarr@mi5.com'
    expect(users[0].password).to eq 'abc123'
    expect(users[1].id).to eq 2
    expect(users[1].name).to eq  'Bill Haydon'
    expect(users[1].username).to eq  'tailor'
    expect(users[1].email).to eq 'BillHaydon@kgb.net'
    expect(users[1].password).to eq 'witchcraft'
  end

  it 'returns a single user specified by id' do
    repo = UserRepository.new
    single_user = repo.find(1)
    expect(single_user[0].id).to eq 1
    expect(single_user[0].name).to eq 'Ricki Tarr'
    expect(single_user[0].username).to eq 'scalphunter'
    expect(single_user[0].email).to eq 'RickiTarr@mi5.com'
    expect(single_user[0].password).to eq 'abc123'
  end

  it 'creates a new user' do
    repo = UserRepository.new
    new_user = User.new
    new_user.name = 'Peter Guillam'
    new_user.username = 'lamplighter'
    new_user.email = 'PeterGuillam@mi5.com'
    new_user.password = 'karate'
    repo.create(new_user)
    find_new_user = repo.find(3)
    expect(find_new_user[0].name).to eq 'Peter Guillam'
    expect(find_new_user[0].username).to eq 'lamplighter'
    expect(find_new_user[0].email).to eq 'PeterGuillam@mi5.com'
    expect(find_new_user[0].password).to eq 'karate'
  end

  it 'deletes a single user' do
    repo = UserRepository.new
    repo.delete(1)
    users = repo.all
    expect(users.length).to eq 1
    expect(users[0].name).to eq 'Bill Haydon'
    expect(users[0].username).to eq  'tailor'
    expect(users[0].email).to eq 'BillHaydon@kgb.net'
    expect(users[0].password).to eq 'witchcraft'
  end

end










