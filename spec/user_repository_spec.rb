require "user_repository"


def reset_table
  seeds_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seeds_sql)
end

describe UserRepository do
  before(:each) do
    reset_table
  end

  it 'finds all user' do
    repo = UserRepository.new
    users = repo.all
    expect(peeps.length).to eq(3)
    expect(peeps.first.email).to eq('user1@email.com')
    expect(peeps.first.password).to eq('password1')
  end


end
