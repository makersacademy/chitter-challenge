require "user"
require "user_repository" 

def reset_user_table
  seed_sql = File.read('spec/users-peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end 

RSpec.describe UserRepository do 
  before(:each) do 
    reset_user_table
  end 

  it "returns all users" do 
    repo = UserRepository.new 
    user = repo.all

    expect(user.length).to eq 3

    expect(user[0].id).to eq 1
    expect(user[0].email).to eq 'robbie@gmail.com'
    expect(user[0].password).to eq '123'
    expect(user[0].name).to eq 'Robbie'
    expect(user[0].username).to eq 'robbie123'
  end

  it "creates a new user" do 
    repo = UserRepository.new 
    new_user = User.new
    new_user.id = 4
    new_user.email = 'chris@gmail.com'
    new_user.password = 'abc'
    new_user.name = 'Chris'
    new_user.username = 'chris987'

    repo.create(new_user)
    all_users = repo.all 

    expect(all_users[3].email).to eq 'chris@gmail.com'
    expect(all_users[3].password).to eq 'abc' 
    expect(all_users[3].name).to eq 'Chris' 
  end 
end 