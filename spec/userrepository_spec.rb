require 'user'
require 'userrepository'
require 'database_connection'

def reset_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_table
  end

  it "displays all users" do
    new_user = User.new
    repo = UserRepository.new
    users = repo.all
    expect(all_users.length).to eq 5
    expect(all_users[3].id).to eq '3'
    expect(all_users[2].username).to eq 'hermoine'
  end

    it 'creates a new user account' do
    new_user = User.new
    repo = UserRepository.new
    new_user.username = "twilight"
    new_user.name = "Bella Swan"
    new_peep.email = "bella@xyz.com"
    new_peep.password = 'wow123'
    repo.create(new_user)

    expect(all_users.length).to eq(5)
    expect(all_peeps[3].content).to eq "This is a new peep"
    end
  
end