require 'user'
require 'user_repo'
require 'database_connection'

def reset_user_table
  sql_seed = File.read('spec/seeds/seeds_chitter_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec_params(sql_seed)
end

describe UserRepo do
  before(:each) do
    reset_user_table
  end
  
  it "find all users in table" do
    repo = UserRepo.new
    users = repo.all
    expect(users.length).to eq(2)
    expect(users[0].username).to eq("Joe")
    expect(users[0].password).to eq("123")
    
  end

  it "creates a new user" do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = "Colin"
    new_user.password = "emmerdale"
    repo.create_user(new_user)

    users = repo.all
    
    expect(users.length).to eq(3)
    expect(users[2].username).to eq("Colin")
    expect(users[2].password).to eq("emmerdale")
    
  end
end
