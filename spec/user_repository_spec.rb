require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'returns a list of all users' do
    repo = UserRepository.new
    all_users = repo.all
  
    expect(all_users.length).to eq(3)
    expect(all_users.first.name).to eq('Harry Potter')
    expect(all_users.first.username).to eq('The boy who lives')
    expect(all_users.first.email_address).to eq('harrypotter@gmail.com')
    expect(all_users.first.password).to eq('goodday123')
  end

  it 'finds one user -Harry Potter-' do
    repo = UserRepository.new
    user = repo.find(1)

    expect(user.name).to eq ('Harry Potter')
    expect(user.username).to eq ('The boy who lives')
    expect(user.email_address).to eq ('harrypotter@gmail.com')
    expect(user.password).to eq ('goodday123')
  end

  it 'finds another user -Ron Weasley-' do
    repo = UserRepository.new
    user = repo.find(2)

    expect(user.name).to eq ('Ron Weasley')
    expect(user.username).to eq ('Ron.W')
    expect(user.email_address).to eq ('ronweasley@yahoo.com')
    expect(user.password).to eq ('RupertGrint95')
  end

  it 'creates a new user -Example-' do
    repo = UserRepository.new
  
    new_user = User.new
    new_user.name = 'Example'
    new_user.username = 'Ex'
    new_user.email_address = 'example@hotmail.com'
    new_user.password = 'abc123'

    repo.create(new_user)

    all_users = repo.all

    expect(all_users.length).to eq(4)
    expect(all_users.last.name).to eq('Example')
    expect(all_users.last.username).to eq('Ex')
  end

  it 'deletes a user' do
    repo = UserRepository.new
    repo.delete(3)
    all_users = repo.all

    expect(all_users.length).to eq(2)
    expect(all_users.last.name).to eq('Ron Weasley')
  end
end
