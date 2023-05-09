require "user_repository"

def reset_chitter_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_chitter_tables
  end

  it 'finds a user' do
    repo = UserRepository.new

    user = repo.find('phil')

    expect(user.id).to eq  2
    expect(user.name).to eq  'Philip'
    expect(user.email).to eq  'philsemail@email.com'
    expect(user.username).to eq 'phil'
  end

  it 'creates a new user' do
    user = User.new
    user.name = 'Pip'
    user.email =  'pipsemail@email.com'
    user.username = 'pip1'

    repo = UserRepository.new

    repo.create(user)

    last_user = repo.find('pip1')

    expect(last_user.id).to eq  3
    expect(last_user.name).to eq  'Pip'
    expect(last_user.email).to eq  'pipsemail@email.com'
    expect(last_user.username).to eq 'pip1'


  end

end