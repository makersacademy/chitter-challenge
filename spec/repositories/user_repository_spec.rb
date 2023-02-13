
require 'user_repository'

describe UserRepository do
  def reset_tables
    seed_sql = File.read('seeds/test_seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'twitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  # it 'returns an array of every tweet' do
  #   repo = UserRepository.new

  #   items = repo.all

  #   expect(items.length).to eq 5
  #   expect(items.first.item_name).to eq '叉烧包'
  #   expect(items.first.unit_price).to eq '5'
  #   expect(items.first.quantity).to eq '10'
  # end

  it 'returns the name & username of a user based on id' do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.name).to eq 'Ryan Lai'
    expect(user.username).to eq 'ryan__lai__'
    expect(user.email).to eq 'ryanlai12@gmail.com'
    expect(user.password).to eq 'abc123'

  end

  it 'creates a new user and adds it to the users table' do
    repo = UserRepository.new

    new_user = User.new
    new_user.name = 'Emma Copsey'
    new_user.username = 'emma__copsey__'
    new_user.email = 'emmacopsey@gmail.com'
    new_user.password = '123abc'

    repo.create(new_user)

    user = repo.find(2)
    expect(user.name).to eq 'Emma Copsey'
    expect(user.username).to eq 'emma__copsey__'
    expect(user.email).to eq 'emmacopsey@gmail.com'
  end
end