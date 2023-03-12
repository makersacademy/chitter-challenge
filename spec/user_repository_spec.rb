require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_users_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe User do

  before(:each) do 
    reset_users_table
  end
  
  it "returns all users" do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 3

    expect(users[0].name).to eq 'Magpie'
    expect(users[0].username).to eq 'Mag Pie'

    expect(users[1].name).to eq 'Mockingbird'
    expect(users[1].username).to eq 'Mocking Bird'

    expect(users[2].name).to eq 'Nightingale'
    expect(users[2].username).to eq 'Night Ingale'
  end
end