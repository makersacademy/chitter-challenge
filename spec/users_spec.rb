require 'user'
require 'database_helpers'

describe User do

  describe '.create' do
    it 'hashes the password using BCrypt' do
      # connection = PG.connect(dbname: 'chitter_test')
      expect(BCrypt::Password).to receive(:create).with('hagrid123')
      User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    end

    it 'creates a new user' do
      connection = PG.connect(dbname: 'chitter_test')
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    
      expect(user).to be_a User
      expect(user.username).to eq('Hagrid')
      expect(user.email).to eq('hagrid@gmail.com')
    end
  end

describe '.find' do
  it 'finds a user by ID' do
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    result = User.find(id: user.id)

    expect(result.id).to eq(user.id)
    expect(result.username).to eq(user.username)
    expect(result.email).to eq(user.email)
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(id: nil)).to eq nil
  end
end

# describe '.login' do 
#   it 'logs in a user' do
#     connection = PG.connect(dbname: 'chitter_test')
#     user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
#     result = User.login(email: 'hagrid@gmail.com', password: 'hagrid123')
#     expect(result.email).to eq(user.email)
#     expect(result.password).to eq(user.password)

#   end
# end

end