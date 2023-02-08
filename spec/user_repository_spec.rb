require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
    @repo = UserRepository.new
  end

  it 'returns a list of user objects' do
    expect(@repo.all.length).to eq 3 
    expect(@repo.all.first.name).to eq 'Luke'
    expect(@repo.all.last.name).to eq 'Jenny'
  end
end
