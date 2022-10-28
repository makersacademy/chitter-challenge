require 'user_repository'

def reset_chitter_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end
  
describe UserRepository do
  before(:each) do 
    reset_chitter_table
  end

  it 'returns all User objects' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 3

    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'Anna'
    expect(users[0].username).to eq 'anna123'
    expect(users[0].email).to eq 'anna@makersacademy.com'
    expect(users[0].password).to eq '235346hgsdv'
    
    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'John'
    expect(users[1].username).to eq 'john123'
    expect(users[1].email).to eq 'john123@makersacademy.com'
    expect(users[1].password).to eq 'ddff!@£!@$34tfsd'
  end

  context "when looking for a user by ID" do
    it 'returns one User object' do
      repo = UserRepository.new
      user = repo.find(2)

      expect(user.id).to eq 2
      expect(user.name).to eq 'John'
      expect(user.username).to eq 'john123'
      expect(user.email).to eq 'john123@makersacademy.com'
      expect(user.password).to eq 'ddff!@£!@$34tfsd'
    end

    it "returns 'no record found' if user's ID is not in the database" do
      repo = UserRepository.new
      expect(repo.find(10)).to eq "No record found"
    end
  end

  context "when creating a User object" do
    it 'creates a User object' do
      repo = UserRepository.new
      new_user = User.new
      new_user.name = 'Joanna'
      new_user.username = 'joanna123'
      new_user.email = 'joannaMccain@makersacademy.com'
      new_user.password = 'er4gg@$34tfsd'
      expect(repo.create(new_user)).to eq nil
      expect(repo.all.length).to eq 4
      added_user = repo.all[-1]
      expect(added_user.id).to eq 4
      expect(added_user.name).to eq 'Joanna'
      expect(added_user.username).to eq 'joanna123'
      expect(added_user.email).to eq 'joannaMccain@makersacademy.com'
      expect(added_user.password).to eq 'er4gg@$34tfsd'
    end
  end

  context "when verifying if the email exists in the database" do
    it 'returns true if the record has been found' do
      repo = UserRepository.new
      result = repo.email_exists?('anna@makersacademy.com')
      expect(result).to eq true
    end

    it "returns false if no record found" do
      repo = UserRepository.new
      result = repo.email_exists?('arabella@makersacademy.com')
      expect(result).to eq false
    end
  end

  context "when verifying if the username exists in the database" do
    it 'returns true if the record has been found' do
      repo = UserRepository.new
      result = repo.username_exists?('anna123')
      expect(result).to eq true
    end

    it "returns false if no record found" do
      repo = UserRepository.new
      result = repo.username_exists?('arabella123')
      expect(result).to eq false
    end
  end
end
