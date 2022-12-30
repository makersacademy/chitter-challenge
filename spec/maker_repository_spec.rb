require 'maker_repository'

describe MakerRepository do

def reset_maker_table
    seed_sql = File.read('spec/seeds_makers.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
end

before(:each) do
    reset_maker_table
end
  it 'list all makers' do
    repo = MakerRepository.new

    user = repo.all

    expect(user.length).to eq 2

    expect(user[0].id).to eq '1'
    expect(user[0].name).to eq 'name1'
    expect(user[0].username).to eq  'user1'
    expect(user[0].email).to eq 'name1@email.com'
    expect(user[0].password).to eq 'password1'

    expect(user[1].id).to eq  '2'
    expect(user[1].name).to eq  'name2'
    expect(user[1].username).to eq  'user2'
    expect(user[1].email).to eq 'name2@email.com'
    expect(user[1].password).to eq 'password2'
  end

  it 'finds a single maker' do
    repo = MakerRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.name).to eq 'name1'
    expect(user.username).to eq 'user1'
    expect(user.email).to eq 'name1@email.com'
    expect(user.password).to eq 'password1'
  end

  it 'creates a new maker' do

    repo = MakerRepository.new

    new_user = Maker.new

    new_user.id = '3'
    new_user.name = 'name3'
    new_user.username =  'user3'
    new_user.email = 'name3@email.com'
    new_user.password = 'password3'

    repo.create(new_user)

    users = repo.all

    expect(users).to include(
    have_attributes(
      id: new_user.id,
      name: new_user.name,
      username: new_user.username,
      email: new_user.email,
      password: new_user.password
      )
    )
  end

  it 'checks existing users by email' do
    repo = MakerRepository.new
    users = repo.find_by_email('name3@email.com')

    expect(users).to eq nil

    new_user = Maker.new

    new_user.id = '3'
    new_user.name = 'name3'
    new_user.username = 'user3'
    new_user.email = 'name3@email.com'
    new_user.password = 'password3'

    repo.create(new_user)

    users = repo.find_by_email('name3@email.com')

    expect(users.id).to eq '3'
    expect(users.name).to eq 'name3'
    expect(users.username).to eq 'user3'
    expect(users.email).to eq 'name3@email.com'
    expect(users.password).to eq 'password3'

  end

  it 'checks existing users by username' do
    repo = MakerRepository.new
    users = repo.find_by_username('name3')

    expect(users).to eq nil

    new_user = Maker.new

    new_user.id = '3'
    new_user.name = 'name3'
    new_user.username = 'user3'
    new_user.email = 'name3@email.com'
    new_user.password = 'password3'

    repo.create(new_user)

    users = repo.find_by_username('user3')

    expect(users.id).to eq '3'
    expect(users.name).to eq 'name3'
    expect(users.username).to eq 'user3'
    expect(users.email).to eq 'name3@email.com'
    expect(users.password).to eq 'password3'
  end

  it 'checks for login details (email and password)' do
    repo = MakerRepository.new
    users = repo.find_by_values('name3@email.com', 'password3')

    expect(users).to eq nil

    new_user = Maker.new

    new_user.id = '3'
    new_user.name = 'name3'
    new_user.username = 'user3'
    new_user.email = 'name3@email.com'
    new_user.password = 'password3'

    repo.create(new_user)

    users = repo.find_by_values('name3@email.com','password3')

    expect(users.id).to eq '3'
    expect(users.name).to eq 'name3'
    expect(users.username).to eq 'user3'
    expect(users.email).to eq 'name3@email.com'
    expect(users.password).to eq 'password3'
  end

  it 'checks session id' do
    repo = MakerRepository.new
    users = repo.find_by_session_id('123456')
    expect(users).to eq nil

    new_user = Maker.new
    session_id = "123456"

    new_user.id = '3'
    new_user.name = 'name3'
    new_user.username = 'user3'
    new_user.email = 'name3@email.com'
    new_user.password = 'password3'

    repo.create(new_user)

    repo.update_session_id(new_user.id, session_id)

    user = repo.find_by_session_id(session_id)
    expect(user).to be_a(Maker)
  end
end
