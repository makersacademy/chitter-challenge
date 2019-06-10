require './models/user'

describe User do

  it 'can have a name, email, username, password' do
    # user = User.create(name: "Egle Bernotaite", username: "ebernot", email: "ebernot@whodis.com", password: "fakePWD123")
    user = User.find(1)
    expect(user.name).to eq "John Smith"
    expect(user.username).to eq "j_smith"
  end

  it 'can allow creation of new user' do
    user = User.create(name: "Egle Bernotaite", username: "ebernot", email: "ebernot@domain.com", password: "fakePWD123")
    users = User.all
    expect(users[2].name).to eq "Egle Bernotaite"
    expect(users[2].username).to eq "ebernot"
    expect(users[2].email).to eq "ebernot@domain.com"
  end

  it 'finds a user by id' do
    result = User.find(1)

    expect(result.id).to eq "1"
    expect(result.name).to eq 'John Smith'
    expect(result.username).to eq 'j_smith'
  end

  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(name: "John Smith", username: "j_smith", email: "j.s@domain.com", password: "password123")
    end
  end

  describe '.authenticate' do
    it 'returns a user given one exists with a correct username and password' do 
      user = User.create(name: 'Test', username: 'test', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password:'password123')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(name: 'Test', username: 'test', email: 'test@example.com', password: 'password123')
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(name: 'Test', username: 'test', email: 'test@example.com', password: 'password123')
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end