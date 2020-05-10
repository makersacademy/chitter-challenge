require 'user'

describe User do

  let(:user) { User.create(
                name: 'Marius',
                username: 'mbrad26',
                email: 'marius2020@gmail.com',
                password: 'apassword'
              ) }

  describe '.create' do
    it 'creates and stores a user in the database' do
      user
      persisted_data = PG.connect(dbname: 'chitter-test')
                         .exec("SELECT * FROM users WHERE id = '#{user.id}';")

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Marius'
      expect(user.username).to eq 'mbrad26'
      expect(user.email).to eq 'marius2020@gmail.com'
    end

    it 'creates a password hash' do
      expect(BCrypt::Password).to receive(:create).with('apassword')

      user
    end
  end

  describe '.find' do
    it ' retrieves a user from database' do
      user
      found_user = User.find(id: user.id)

      expect(found_user.id).to eq user.id
      expect(found_user.name).to eq user.name
      expect(found_user.username).to eq user.username
      expect(found_user.email).to eq user.email
    end

    it 'returns nil if no id is given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user from database if credentials check' do
      user
      authenticated_user = User.authenticate(email: 'marius2020@gmail.com', password: 'apassword')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if the email doesn\'t match' do
      user
      signing_in_user = User.authenticate(email: 'wrongemail@gmail.com', password: 'apassword')

      expect(signing_in_user).to be_nil
    end

    it 'returns nil if the password doesn\'t match' do
      user
      signing_in_user = User.authenticate(email: 'marius2020@gmail.com', password: 'wrongpassword')

      expect(signing_in_user).to be_nil
    end
  end
end
