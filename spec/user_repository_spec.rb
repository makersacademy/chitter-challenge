require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_users_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do

  before(:each) do 
    reset_users_table
  end

  it "returns all users" do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 3

    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'Magpie'
    expect(users[0].username).to eq 'Mag Pie'

    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'Mockingbird'
    expect(users[1].username).to eq 'Mocking Bird'

    expect(users[2].id).to eq 3
    expect(users[2].name).to eq 'Nightingale'
    expect(users[2].username).to eq 'Night Ingale'
  end

  it "returns a single user with the given id" do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq 1
    expect(user.name).to eq 'Magpie'
    expect(user.username).to eq 'Mag Pie'
  end

  it "creates a new user" do
    repo = UserRepository.new

    user = User.new
    user.email = 'sparrow@mail.com'
    user.password = 'sparrow2023'
    user.name = 'Sparrow'
    user.username = 'Spar Row'

    repo.create(user)

    all_users = repo.all 

    expect(all_users).to include(
      have_attributes(
        email: user.email,
        password: user.password,
        name: user.name,
        username: user.username
      )
    )
  end

  it "deletes a user with the given id" do
    repo = UserRepository.new

    repo.delete(1)

    all_users = repo.all 

    expect(all_users).not_to include(
      have_attributes(
        email: 'magpie@mail.com',
        password: 'magpie2023',
        name: 'Magpie',
        username: 'Mag Pie'
      )
    )
  end

end