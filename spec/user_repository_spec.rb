require 'user_repository'

RSpec.describe UserRepository do

  def reset_chitter_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
  end


  before(:each) do 
    reset_chitter_table
  end

  it 'returns a list of users' do
    repo = UserRepository.new

    users = repo.all
    expect(users.length).to eq(2)
    expect(users.first.id).to eq('1')
    expect(users.first.name).to eq('Hayley')
    expect(users.first.username).to eq('iamdobbs')
  end  

  it 'creates a new user record' do
    repo = UserRepository.new

    user = User.new
    user.name = 'Tom'
    user.username = 'Tommy'
    user.email = 'tommy@makers.com'
    user.password = 'codingisfun'

    repo.create(user)

    user = repo.all

    last_user = user.last
    expect(last_user.name).to eq('Tom')
    expect(last_user.username).to eq('Tommy')
    expect(last_user.email).to eq('tommy@makers.com')
    expect(last_user.password).to eq('codingisfun')
  end    
end