require 'user'

def reset_users_table
  seed_sql = File.read('spec/seeds/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe User do
  before(:each) do 
    reset_users_table
    ActiveRecord::Base.establish_connection(
      adapter:  'postgresql',
      database: 'chitter_test'
    )
  end

  it 'gets all users' do
    users = User.all
    expect(users.length).to eq 4
    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'John Isaac'
    expect(users[0].username).to eq 'JI2022'
    expect(users[0].email).to eq 'john@hotmail.com'
    expect(users[0].password).to eq 'password123'
  end

  it 'find a user based on id' do
    user = User.find(2)
    expect(user.id).to eq 2
    expect(user.name).to eq 'Daniel Roma'
    expect(user.username).to eq 'BeatTheHeat'
    expect(user.email).to eq 'danny@gmail.com'
    expect(user.password).to eq 'admin'
  end

  it 'creates a new user' do
    User.create(
      name: 'Zac Moss',
      username: 'zacmosshk',
      email: 'email@email.com',
      password: 'password456'
    )
    users = User.all
    expect(users.length).to eq 5
    expect(users[4].id).to eq 5
    expect(users[4].name).to eq 'Zac Moss'
    expect(users[4].username).to eq 'zacmosshk'
    expect(users[4].email).to eq 'email@email.com'
    expect(users[4].password).to eq 'password456'
  end

  it 'finds users by username' do
    user = User.find_by(username: 'FunkyB')
    expect(user.id).to eq 3
    expect(user.name).to eq 'Marky Mark'
    expect(user.username).to eq 'FunkyB'
    expect(user.email).to eq 'marky@yahoo.com'
    expect(user.password).to eq 'goodvibes'
  end

  it 'finds users by email' do
    user = User.find_by(email: 'yoda@starwars.com')
    expect(user.id).to eq 4
    expect(user.name).to eq 'Baby Yoda'
    expect(user.username).to eq 'mandoDisneyLover'
    expect(user.email).to eq 'yoda@starwars.com'
    expect(user.password).to eq 'jediking'
  end
end
