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
    all_users = repo.all
    expect(all_users.length).to eq 5
    expect(all_users[3].id).to eq '4'
    expect(all_users[2].username).to eq 'ronw'
  end

    it 'creates a new user account' do
    new_user = User.new
    repo = UserRepository.new
    new_user.username = "twilight"
    new_user.name = "Bella Swan"
    new_user.email = "bella@xyz.com"
    new_user.password = 'wow123'
    repo.create(new_user)

    all_users = repo.all 

    expect(all_users.length).to eq(6)
    end

    it "signs in the user" do
      user = User.new
      repo = UserRepository.new
      user.email = "tom@xyz.com"
      find_user = repo.find_by_email("tom@xyz.com")
      
      expect(find_user.id).to eq(5)
      expect(find_user.username).to eq("voldemort")
      expect(find_user.name).to eq('Tom Marvolo Riddle')
    end
  
end