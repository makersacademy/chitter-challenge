require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'shows all users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq(3)
    expect(users.first.user_name).to eq('sidra_fake')
  end
end
