require 'user_model'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/user_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it "retrieves all users" do
    user_repo = UserRepository.new
    all_users = user_repo.all
    expect(all_users.length).to eq 3  
    expect(all_users[0].full_name).to eq('giorgio george')
    expect(all_users[1].full_name).to eq('harold harrington')
    expect(all_users[2].full_name).to eq('ophelia offing')
  end
  
  it "creates a new user and stores it in the database" do 
    user_repo = UserRepository.new
    new_user = User.new

    new_user.email = 'bob@bobmail.com'
    new_user.pass_word = 'burgers' 
    new_user.username = 'burgerbob'
    new_user.full_name = 'bob alob' 

    user_repo.create(new_user)
    
    all_users = user_repo.all
    expect(all_users.length).to eq 4
    expect(all_users[3].username).to eq 'burgerbob'
  end 
end
