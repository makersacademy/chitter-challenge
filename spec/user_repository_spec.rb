require 'user_repository'
require 'user'
require 'database_connection'

def reset_peeps_table
  seed_sql = File.read('spec/seeds_peeps_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test'})
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_peeps_table
  end

  it "lists all users" do
    repo = UserRepository.new
    expect(repo.all.first.username).to eq 'anna1'
    expect(repo.all.first.name).to eq 'Anna Smith'
    expect(repo.all.first.email).to eq 'anna@makersacademy.com'
    expect(repo.all.length).to eq 2
  end

  it "creates a new user" do
    user = User.new
    user.name = "Mike"
    user.username = "mikey"
    user.password = "easypassword"
    user.email = "mikes@makersacademy.com"
    repo = UserRepository.new
    repo.create(user)
    expect(repo.all.length).to eq 3
    expect(repo.all[-1].username).to eq 'mikey'
    expect(repo.all[-1].name).to eq 'Mike'
    expect(repo.all[-1].email).to eq 'mikes@makersacademy.com'
  end

  it "finds the user by its email" do
    repo = UserRepository.new
    result = repo.find_by_email('samm@makersacademy.com')
    expect(result.name).to eq 'Sam Morgan'
    expect(result.email).to eq 'samm@makersacademy.com'
    expect(result.username).to eq 'sjmog'
  end

  it "checks user credintials in the database" do
    repo = UserRepository.new
    expect(repo.sign_in('samm@makersacademy.com', 'password123')).to be_truthy
    expect(repo.sign_in('samm@makersacademy.com', 'password1234')).to be_falsy
  end
end