require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  it "returns a user-object when passed an email" do
    repo = UserRepository.new
    found_user = repo.find('phil@makers.com')
    expect(found_user.id).to eq '3'
    expect(found_user.username).to eq 'Phil'
    expect(found_user.email).to eq 'phil@makers.com'
  end

  it "creates a new user, which is returned when the find method is called" do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = 'Keira'
    new_user.email = 'keira@makers.com'
    new_user.password = 'red72!dragon'
    repo.create(new_user)

    found_user = repo.find('keira@makers.com')
    expect(found_user.id).to eq '4'
    expect(found_user.username).to eq 'Keira'
    expect(found_user.email).to eq 'keira@makers.com'
  end
end