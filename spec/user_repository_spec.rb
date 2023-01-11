require_relative '../lib/user'
require_relative '../lib/user_repository'

def reset_tables
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end
  after(:each) do
    reset_tables
  end

  it 'lists all users' do

    repo = UserRepository.new

    users = repo.all
    expect(users.length).to eq 5
    expect(users.first.username).to eq 'brugalheimer'
    expect(users.last.email).to eq 'sabrina@gmail.com'
  end

end
