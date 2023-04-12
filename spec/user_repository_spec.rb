require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'shows all users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq(3)
    expect(users.first.username).to eq('sidra_fake')
  end

  it 'finds a user based on email address' do
    repo = UserRepository.new
    user = repo.find_by_email('sidra@fake.com')

    expect(user.username).to eq('sidra_fake')
  end

  it 'creates a new user' do
    repo = UserRepository.new

    new_user = User.new
    new_user.email_address = 'angel@fake.com'
    new_user.username = 'angel_fake'
    new_user.password = 'password123' # set the plaintext password

    encrypted_password = BCrypt::Password.create(new_user.password)
    new_user.password = encrypted_password # set the encrypted password

    repo.create(new_user)
    users = repo.all
    expect(users.last.username).to eq('angel_fake')
  end
end
