require 'users'
require 'users_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  it 'lists all users' do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq(3)
    expect(users.first.id).to eq(1)
    expect(users.first.username).to eq('orangeman')
    expect(users.first.email).to eq('donald@example.com')
    expect(users.last.id).to eq(3)
  end
end