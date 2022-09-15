require 'user'
require 'user_repository'

def reset_table
  seed_sql = File.read('spec/seeds/seeds_tests.sql')
  user = ENV['PGUSER1']
  password = ENV['PGPASSWORD']
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: user, password: password })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_table
  end

  it 'finds all users' do
    repo = UserRepository.new
    users = repo.all
    
    expect(users.length).to eq(8)
    expect(users.first.id).to eq(1)
    expect(users.first.email).to eq('wendy0@example.com')
    expect(users.first.password).to eq('password123')
    expect(users.first.f_name).to eq('Wendy')
    expect(users.first.handle).to eq('wendy0')
  end

end