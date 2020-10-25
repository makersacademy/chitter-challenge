require 'user'

describe User do

  describe '.set_current_user' do
    it 'sets the current user' do
      user = User.create(name: "Rose Tyler", username: "badwolf", email: "rtyler@tardis.com", password: "raxacoricofallapatorius")
      User.set_current_user(user)
      rose = User.current_user
      expect(rose.id).to eq user.id
      expect(rose.name).to eq user.name
      expect(rose.username).to eq user.username
      expect(rose.email).to eq user.email
    end
  end

  describe '.create' do
    it 'creates a user' do
      user = User.create(name: "Rose Tyler", username: "badwolf", email: "rtyler@tardis.com", password: "raxacoricofallapatorius")
      data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq data.first['id']
      expect(user.name).to eq data.first['name']
      expect(user.username).to eq data.first['username']
      expect(user.password).to eq data.first['password']
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('raxacoricofallapatorius')
    
      User.create(name: "Rose Tyler", username: "badwolf", email: "rtyler@tardis.com", password: "raxacoricofallapatorius")
    end
  end

  describe '.find' do
    it 'returns user matching id' do
      user = User.create(name: "Mickey Smith", username: "lonelyboy", email: "mick@brokenheart.com", password: "comebackrose")
      result = User.find(user.id)

      expect(result).to be_a User
      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
      expect(result.password).to eq user.password
    end
  end

  describe '.authenticate' do
    it 'returns a user if given correct email and password' do
      user = User.create(name: "John Doe", username: "boringman", email: "john@doe.com", password: "johndoe")
      authenticated_user = User.authenticate(email: "john@doe.com", password: "johndoe")

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if given incorrect email' do
      User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
      expect(User.authenticate(email: "karen@karen.com", password: "theworst")).to be_nil
    end

    it 'returns nil if given incorrect password' do
      User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
      expect(User.authenticate(email: "karen@entitled.com", password: "thebest")).to be_nil
    end
  end

  describe '.sign_out' do
    it 'sets current_user to anonymous' do
      user = User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
      expect(User.current_user).to eq user
      User.sign_out
      expect(User.current_user).to eq "Anonymous"
    end
  end

  describe '.exists?' do
    it 'returns true if email already in use' do
      User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
      expect(User.exists?(email: "karen@entitled.com", username: "karen")).to eq true
    end

    it 'returns true if username already in use' do
      User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
      expect(User.exists?(email: "karen@newmail.co.uk", username: "shopaholic")).to eq true
    end
  end
end
