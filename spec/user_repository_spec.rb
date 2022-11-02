require 'user_repository'

RSpec.describe UserRepository do

  def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_users_table
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
    new_user.name = 'Candy Lane'
    new_user.username = 'CandyL'
    new_user.email = 'candy@chittermail.com'
    new_user.password = "2teasplease"
    
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
end
