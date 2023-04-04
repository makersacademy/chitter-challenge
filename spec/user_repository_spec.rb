require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
  reset_users_table
  end

  it 'lists all the users' do
    repo = UserRepository.new
    expect(repo.all.length).to eq 7
    expect(repo.all[0].name).to eq('Johny')
  end


  it 'creates a new account for the user' do
    repo = UserRepository.new
    new_user = User.new
    new_user.name = 'Pola'
    new_user.username = 'IamPola'
    new_user.email_address = 'pola@icloud.com'
    new_user.password_hash = 'botswana'
    repo.create(new_user)
    expect(repo.all.length).to eq 8
    expect(repo.all.last.name).to eq 'Pola'
  end

  it 'creates a login access for the user' do
    repo = UserRepository.new
    login = repo.login('sarahsmith5678@gmail.com','dogS555!')
    expect(login).to eq true
  end

  it 'creates a login access for the user' do
    repo = UserRepository.new
    login = repo.login('kevinchen0123live.com','greece$2023')
    expect(login).to eq nil
  end


  it 'creates a login access for the user' do
    repo = UserRepository.new
    login = repo.login('amandamiller4567@aol.com','sw6587&')
    expect(login).to eq false
  end


it 'finds user by id' do
    repo = UserRepository.new
    user = repo.find(1)
    expect(user.name).to eq ('Johny')
    expect(user.email_address).to eq('johndoe1234@example.com')
  end

  it 'finds user by email' do
    repo = UserRepository.new
    user = repo.find_by_email('johndoe1234@example.com')
    expect(user.name).to eq('Johny')
    expect(user.id).to eq (1)
  end
  
end