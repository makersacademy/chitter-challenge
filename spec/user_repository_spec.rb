require 'user_repository'

RSpec.describe UserRepository do

  def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
    before(:each) do
      reset_users_table
    end
    
  it "should get all users" do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 5
    expect(users[0].id).to eq '1'
    expect(users[0].name).to eq 'Shah'
    expect(users[0].username).to eq 'shussain'
  end 

  it "should create a new user" do
    repo = UserRepository.new
    new_user = User.new
    new_user.email = 'saf@test.com'
    new_user.password = 'toodles'
    new_user.name = 'Soph'
    new_user.username = 'mickeymouse'

    repo.create(new_user)
    users = repo.all
    last_user = users.last

    new_user.name = 'Soph'
    new_user.username = 'mickeymouse'
  end 
end 