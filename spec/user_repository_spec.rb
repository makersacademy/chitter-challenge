require 'user'
require 'user_repository'

def reset_users_table
  seed = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed)
end

describe UserRepository do
  before(:each) do
    reset_users_table
  end

  it 'finds all users' do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 3
    expect(users.first.email).to eq('fake1@fake.com')
    expect(users.first.password).to eq('PASSWORD1')
    expect(users.first.name).to eq('Dave Smith')
    expect(users.first.username).to eq('DVS123')
  end

  it 'find one specific user' do
    repo = UserRepository.new
    user = repo.find(2)

    expect(user.id).to eq(2)
    expect(user.email).to eq('fake2@fake.com')
    expect(user.password).to eq('PASSWORD2')
    expect(user.name).to eq('Abby Martin')
    expect(user.username).to eq('am44')
  end

  it 'creates an user' do
    repo = UserRepository.new

    new_user = User.new
    new_user.email = 'fake4@fake.com'
    new_user.password = 'PASSWORD4'
    new_user.name = 'James Davis'
    new_user.username = 'JD45'
    repo.create(new_user)

    users = repo.all

    expect(users.length).to eq(4)
    expect(users.last.email).to eq('fake4@fake.com')
    expect(users.last.username).to eq('JD45')
  end
end
