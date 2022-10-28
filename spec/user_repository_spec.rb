describe UserRepository do
  
  # 1
  it 'gets a single user' do

    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.name).to eq 'Andy'
    expect(user.username).to eq 'Andy1'
    expect(user.logged_in).to eq false
  end

  # 2
  it 'logs a user in and out with correct details' do

    repo = UserRepository.new

    user = User.new
    user.username = 'Andy1'
    user.password = 'password'

    repo.log_in(user)
    new_user = repo.find(1)
    expect(new_user.logged_in).to eq true

    repo.log_out(1)
    new_user = repo.find(1)
    expect(new_user.logged_in).to eq false
  end

  # 3
  it 'logs a user in with incorrect details' do

    repo = UserRepository.new

    user = User.new
    user.username = 'Andy1'
    user.password = 'passw0rd'

    repo.log_in(user)

    new_user = repo.find(1)
    expect(new_user.logged_in).to eq false
  end

  # 4
  it 'returns all users' do

    repo = UserRepository.new

    users = repo.all
    expect(users.first.id).to eq '1'
    expect(users.first.email).to eq 'andy@gmail.com'
    expect(users.first.password).to eq 'password'
    expect(users.first.name).to eq 'Andy'
    expect(users.first.username).to eq 'Andy1'
    expect(users.first.logged_in).to eq false
    expect(users.length).to eq 2
  end

  # 5
  it 'creates a new user' do

    repo = UserRepository.new

    user = User.new
    user.email = 'jim@gmail.com'
    user.password = 'password99'
    user.name = 'Jim'
    user.username = 'Jimbo'
    user.logged_in = true

    temp = repo.create(user)

    users = repo.all
    expect(users.last.id).to eq '3'
    expect(users.last.email).to eq 'jim@gmail.com'
    expect(users.last.password).to eq 'password99'
    expect(users.last.name).to eq 'Jim'
    expect(users.last.username).to eq 'Jimbo'
    expect(users.last.logged_in).to eq false
    expect(users.length).to eq 3
  end
end
