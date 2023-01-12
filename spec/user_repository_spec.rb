require_relative '../lib/user'
require_relative '../lib/user_repository'

def reset_user_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_user_table
  end

  it "#all returns all users" do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 3

    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'Harry Potter'
    expect(users[0].user_name).to eq 'lightning-boy'
    expect(users[0].email).to eq 'harry@hogwarts.com'
    expect(users[0].password).to eq 'scarhead1234'

    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'Ron Weasley'
    expect(users[1].user_name).to eq 'gingernut'
    expect(users[1].email).to eq 'ron@hogwarts.com'
    expect(users[1].password).to eq 'redhead4eva'

    expect(users[2].id).to eq 3
    expect(users[2].name).to eq 'Hermione Granger'
    expect(users[2].user_name).to eq 'clever-cloggs'
    expect(users[2].email).to eq 'herminone@hogwarts.com'
    expect(users[2].password).to eq 'best-in-class'
  end

  it "#find takes an id and returns record" do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq 1
    expect(user.name).to eq 'Harry Potter'
    expect(user.user_name).to eq 'lightning-boy'
    expect(user.email).to eq 'harry@hogwarts.com'
    expect(user.password).to eq 'scarhead1234'
  end

  it "#find_by_user_name returns user details based on user_name" do
    repo = UserRepository.new

    user = repo.find_by_user_name('clever-cloggs')

    expect(user.id).to eq 3
    expect(user.name).to eq 'Hermione Granger'
    expect(user.user_name).to eq 'clever-cloggs'
    expect(user.email).to eq 'herminone@hogwarts.com'
    expect(user.password).to eq 'best-in-class'
  end

  it "#create adds a new user record to the table" do
    repo = UserRepository.new
    new_user = User.new
    new_user.name = 'Luna Lovegood'
    new_user.user_name = 'loonylovegood'
    new_user.email = 'luna@hogwarts.com'
    new_user.password = 'hare-raiser'
    
    repo.create(new_user)
    
    expect(repo.all).to include(
      have_attributes(name: 'Luna Lovegood', user_name: 'loonylovegood', email: 'luna@hogwarts.com', password: 'hare-raiser')
    )
  end
end