require 'database_helpers'

describe User do
describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', user_name: 'katy', password: 'password123')

    expect(user).to be_a User
   # expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
    expect(user.user_name).to eq 'katy'

  end

  it 'hashes the password using Bcrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(email: 'test@example.com', user_name: 'katy', password: 'password123')
  end
  
end

  describe '.find' do 
    it 'returns nil if there is no ID given' do
      expect(User.find(user_id: nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', user_name: 'katy', password: 'password123')
      result = User.find(user_id: user.user_id)

      expect(result.user_id).to eq user.user_id
      expect(result.email).to eq user.email
      expect(result.user_name).to eq user.user_name
    end
  end

  describe '.authenticate' do
  it 'returns a user given a correct email and password, if they exist' do
    user = User.create(user_name: 'katy', email: 'test@example.com', password: 'password123')
    auth_user = User.authenticate(email: 'test@example.com', password: 'password123')

    expect(auth_user.user_id).to eq user.user_id
  end

  it 'returns nil given an uncorrect email address' do
    user = User.create(user_name: 'katy', email: 'test@example.com', password: 'password123')

    expect(User.authenticate(email: 'notherightemail@me.com', password: 'password123')).to be_nil
  end

  it 'returns nil given an incorrect password' do
    user = User.create(user_name: 'katy', email: 'test@example.com', password: 'password')

    expect(User.authenticate(email: 'test@example.com', password: 'incorrectpassword' )).to be_nil
  end

end

end

