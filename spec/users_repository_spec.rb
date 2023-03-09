require "users_repository"

def reset_users_table
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UsersRepository do
  before(:each) do 
    reset_users_table
  end

  it "gets all users" do
    repo = UsersRepository.new

    users = repo.all
    
    expect(users.length).to eq 3
    
    expect(users[0].id).to eq  1
    expect(users[0].username).to eq 'jamespates'
    expect(users[0].email_address).to eq 'james@gmail.com'
    expect(users[0].password).to eq 'Abc123De'
    
    expect(users[1].id).to eq  2
    expect(users[1].username).to eq 'A bad day'
    expect(users[1].email_address).to eq '2023-03-08 10:15:30.123456'
    expect(users[1].password).to eq '2'
  end

  it "gets a single user" do
    repo = UsersRepository.new

    user = repo.find(1)

    expect(users.id).to eq ('1')
    expect(users.username).to eq ('jamespates')
    expect(users.email_address).to eq ('james@gmail.com')
    expect(users.password).to eq ('Abc123De')
  end

  it "creates a single user record" do
    repo = UsersRepository.new

    user = Users.new
    user.username = "john_pates"
    user.email_address = 'john@gmail.com'
    user.password = '4'

    repo.create(user)
    users = repo.all

    last_user = users.last
    expect(last_user.username).to eq ('john_pates')
    expect(last_user.email_address).to eq ("john@gmail.com")
    expect(last_user.password).to eq ("4")
  end

  it "updates a single user record" do
    repo = UsersRepository.new

    user = repo.find(1)

    user.username = "jem_pates"
    user.email_address = "jem@gmail.com"
    user.password = 'Abc123De'

    repo.update(user)

    updated_user = repo.find(1)

    expect(updated_user.username).to eq ("jem_pates")
    expect(updated_user.email_address).to eq ("jem@gmail.com")
    expect(updated_user.password).to eq ('Abc123De')
  end

  it "deletes a single user record" do
    repo = UsersRepository.new

    id_to_delete = 1
    repo.delete(id_to_delete)

    all_users = repo.all
    expect(all_users.length).to eq 2
    expect(all_users.first.id).to eq ('2')
  end
end