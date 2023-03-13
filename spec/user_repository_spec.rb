require 'user_repository'
require 'user_model'

def reset_users_table
    seed_sql = File.read('spec/seeds_peeps_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitterdb_test' })
    connection.exec(seed_sql)
end
  
RSpec.describe UserRepository do
  before(:each) do 
    reset_users_table
end
  
  it 'Returns all users.' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 3
    expect(users[0].id).to eq 1
    expect(users[0].user_name).to eq 'User 1'
    expect(users[0].user_email).to eq 'user1@peep.com'
    expect(users[1].id).to eq 2
    expect(users[1].user_name).to eq 'User 2'
    expect(users[1].user_email).to eq 'user2@peep.com'
  end

  it 'Finds a single user.' do
    repo = UserRepository.new
    user = repo.find(1)
    expect(user.id).to eq 1
    expect(user.user_name).to eq 'User 1'
    expect(user.user_email).to eq 'user1@peep.com'
  end

  it 'Creates a user.' do
    repo = UserRepository.new
    users = repo.all
    user = User.new
    user.id = 4
    user.first_name = 'User'
    user.last_name = '4'
    user.user_name = 'User 4'
    user.user_email = 'user4@peep.com'
    repo.create(user)
    new_user = repo.find(4)
    expect(user.id).to eq 4
    expect(user.user_name).to eq 'User 4'
    expect(user.user_email).to eq 'user4@peep.com'
    users = repo.all
    expect(users.length).to eq 4
  end

  it 'Updates a user.' do
    repo = UserRepository.new
    user = repo.find(1)
    user.last_name = 'One'
    repo.update(user)
    expect(user.last_name).to eq 'One'
  end

  it 'Deletes a user.' do
    repo = UserRepository.new
    users = repo.all
    new_user1 = User.new
    new_user1.first_name = 'Alice'
    new_user1.last_name = 'Wilson'
    new_user1.user_name = 'alicewilson'
    new_user1.user_email = 'alice.wilson@peep.com'
    repo.create(new_user1)
    new_user2 = User.new
    new_user2.first_name = 'Amanda'
    new_user2.last_name = 'Benson'
    new_user2.user_name = 'amandabenson'
    new_user2.user_email = 'amanda.benson@peep.com'
    repo.create(new_user2)
    repo.delete_user(4)
    users = repo.all
    expect(users.length).to eq 4
    expect(users.last.user_email).to eq 'amanda.benson@peep.com'
  end
end
