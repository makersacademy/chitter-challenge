require 'user_repository'

RSpec.describe UserRepository do

  def reset_users_table
    seed_sql = File.read('spec/seeds/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

   def reset_peeps_table
    seed_sql = File.read('spec/seeds/seeds_peeps.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_users_table
    reset_peeps_table
  end

  it 'returns a list of all the users' do
    repo = UserRepository.new

    users = repo.all 

    expect(users.length).to eq 5
    expect(users.first.id).to eq '1'
    expect(users.first.name).to eq "David Jones"
  end

  it 'creates a new user' do
    repo = UserRepository.new

    new_user = User.new
    new_user.name = 'fake_name'
    new_user.username = 'fake_username'
    new_user.email = 'fake@chittermail.com'
    new_user.password = "fake_password"
    
    repo.create(new_user)

    all_users = repo.all

    expect(all_users).to include (
      have_attributes(
        name: new_user.name,
        username: new_user.username,
        email: new_user.email,
        password: new_user.password
      ))
  end

  it 'finds a user by their email address' do
    repo = UserRepository.new

    result = repo.find_by_email('lauren@chittermail.com')

    expect(result.name).to eq ('Lauren Brown')
    expect(result.username).to eq ('Lilauren')
  end

  it 'checks if user login details are correct' do
    repo = UserRepository.new

    expect(repo.login('meg@chittermail.com', 'meglikesdogs1')).to eq false
  end
end
